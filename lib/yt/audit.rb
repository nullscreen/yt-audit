require 'yt'
require 'yt/annotations'

module Yt
  class Audit

    attr_reader :info_card_count, :brand_anchor_count, :subscribe_count, :association_count, :end_card_count, :videos_count

    # Audit a channel
    # @param [String] channel_id of the channel to audit.
    # @return [Yt::Audit] the object with video count attributes
    def self.for(channel_id)
      channel = Yt::Channel.new(id: channel_id)
      video_ids = channel.videos.first(10).map(&:id)
      new.tap do |audit|
        audit.instance_variable_set :@info_card_count, video_ids.count {|id| has_info_cards?(id) }
        audit.instance_variable_set :@brand_anchor_count, video_ids.count {|id| has_brand_anchoring?(id, channel.title) }
        audit.instance_variable_set :@subscribe_count, video_ids.count {|id| has_subscribe_annotations?(id) }
        audit.instance_variable_set :@association_count, video_ids.count {|id| has_link_to_own_channel?(id) }
        audit.instance_variable_set :@end_card_count, video_ids.count {|id| has_end_cards?(id) }
        audit.instance_variable_set :@videos_count, video_ids.count
      end
    end

  private

    # Audit any info card of a video
    # @param [String] video_id the video to audit.
    # @return [Boolean] if the video has any info card.
    def self.has_info_cards?(video_id)
      Yt::Annotations.for(video_id).any? do |annotation|
        annotation.is_a? Yt::Annotations::Card
      end
    end

    # Audit brand anchoring of a video
    # @param [String] video_id the video to audit.
    # @param [String] brand name of the video to audit.
    # @return [Boolean] if the video title includes brand name.
    def self.has_brand_anchoring?(video_id, brand)
      video_title = Yt::Video.new(id: video_id).title
      !!video_title[/#{brand}/i]
    end

    # Audit any subscribe annotation of a video
    # @param [String] video_id the video to audit.
    # @return [Boolean] if the video has any link to subscribe in the annotations.
    def self.has_subscribe_annotations?(video_id)
      Yt::Annotations.for(video_id).any? do |annotation|
        annotation.link && annotation.link[:type] == :subscribe
      end
    end

    # Audit youtube association of a video
    # @param [String] video_id the video to audit.
    # @return [Boolean] if the video description has link to its own channel.
    def self.has_link_to_own_channel?(video_id)
      video = Yt::Video.new(id: video_id)
      video.description.split(' ')
           .select {|word| Yt::URL.new(word).kind == :channel }
           .any? {|link| Yt::Channel.new(url: link).id == video.channel_id }
    end

    # Audit end cards of a video
    # @param [String] video_id of the video to audit.
    # @return [Boolean] if the video has any annotation, other than info cards,
    #   with a link in it, at the end of video, stays for more than 5 seconds.
    def self.has_end_cards?(video_id)
      video_duration = Yt::Video.new(id: video_id).duration
      Yt::Annotations.for(video_id).any? do |annotation|
        !annotation.is_a?(Yt::Annotations::Card) && annotation.link &&
          (annotation.ends_at.floor..annotation.ends_at.ceil).include?(video_duration) &&
          video_duration - annotation.starts_at > 5
      end
    end
  end
end
