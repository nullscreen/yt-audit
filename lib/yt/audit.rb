require 'yt'
require 'yt/annotations'

module Yt
  module Audit
    # Audit any info card of a video
    # @param [String] video_id the video to audit.
    # @return [Boolean] if the video has any info card.
    # @raise [NoMethodError] if video_id is not a valid video.
    def self.has_info_cards?(video_id)
      Yt::Annotations.for(video_id).any? do |annotation|
        annotation.is_a? Yt::Annotations::Card
      end
    end

    # Audit brand anchoring of a video
    # @param [String] video_id the video to audit.
    # @param [String] brand name of the video to audit.
    # @return [Boolean] if the video title includes brand name.
    # @raise [Yt::Errors::NoItems] if video_id is not a valid video.
    def self.has_brand_anchoring?(video_id, brand)
      video_title = Yt::Video.new(id: video_id).title
      !!video_title[/#{brand}/i]
    end

    # Audit any subscribe annotation of a video
    # @param [String] video_id the video to audit.
    # @return [Boolean] if the video has any link to subscribe in the annotations.
    # @raise [NoMethodError] if video_id is not a valid video.
    def self.has_subscribe_annotations?(video_id)
      Yt::Annotations.for(video_id).any? do |annotation|
        annotation.link && annotation.link[:type] == :subscribe
      end
    end
  end
end
