require 'yt'
require 'yt/annotations'
require 'yt/video_audit/info_card'
require 'yt/video_audit/brand_anchoring'
require 'yt/video_audit/subscribe_annotation'
require 'yt/video_audit/youtube_association'
require 'yt/video_audit/end_card'
require 'yt/playlist_audit/description'

module Yt
  class Audit
    def initialize(channel_id:)
      @channel_id = channel_id
    end

    def run
      [
        Yt::VideoAudit::InfoCard.new(videos: videos),
        Yt::VideoAudit::BrandAnchoring.new(videos: videos, brand: channel.title),
        Yt::VideoAudit::SubscribeAnnotation.new(videos: videos),
        Yt::VideoAudit::YoutubeAssociation.new(videos: videos),
        Yt::VideoAudit::EndCard.new(videos: videos),
        Yt::PlaylistAudit::Description.new(playlists: playlists)
      ]
    end

  private

    def playlists
      @playlists ||= channel.playlists.first 10
    end

    def videos
      @videos ||= channel.videos.includes(:snippet).first 10
    end

    def channel
      @channel ||= Yt::Channel.new id: @channel_id
    end
  end
end
