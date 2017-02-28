require 'yt'
require 'yt/annotations'
require 'yt/url'
require 'yt/video_audit/info_card'
require 'yt/video_audit/brand_anchoring'
require 'yt/video_audit/subscribe_annotation'
require 'yt/video_audit/youtube_association'
require 'yt/video_audit/end_card'
require 'yt/playlist_audit/description'

module Yt
  class Audit
    def initialize(channel:, videos: nil, playlists: nil, brand: nil)
      @channel = channel
      @videos = videos || channel.videos.includes(:snippet).first(10)
      @playlists = playlists || channel.playlists.first(10)
      @brand = brand || channel.title
    end

    def run
      [
        Yt::VideoAudit::InfoCard.new(videos: @videos),
        Yt::VideoAudit::BrandAnchoring.new(videos: @videos, brand: @brand),
        Yt::VideoAudit::SubscribeAnnotation.new(videos: @videos),
        Yt::VideoAudit::YoutubeAssociation.new(videos: @videos),
        Yt::VideoAudit::EndCard.new(videos: @videos),
        Yt::PlaylistAudit::Description.new(playlists: @playlists)
      ]
    end
  end
end
