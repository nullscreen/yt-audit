require 'yt/core'
require 'yt/annotations'
require 'yt/url'
require 'yt/video_audit/info_card'
require 'yt/video_audit/brand_anchoring'
require 'yt/video_audit/subscribe_annotation'
require 'yt/video_audit/youtube_association'
require 'yt/video_audit/end_card'
require 'yt/playlist_audit/description'
require 'yt/video_audit/end_screen'
require 'yt/video_audit/tags_length'
require 'yt/video_audit/subscribe_end_screen'
require 'yt/video_audit/video_end_screen'
require 'yt/video_audit/playlist_end_screen'
require 'yt/video_audit/website_end_screen'

module Yt
  class Audit
    def initialize(channel:, videos: nil, playlists: nil, brand: nil)
      @channel = channel
      @videos = videos || channel.videos.select(:snippet).first(10)
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
        Yt::PlaylistAudit::Description.new(playlists: @playlists),
        Yt::VideoAudit::EndScreen.new(videos: @videos),
        Yt::VideoAudit::TagsLength.new(videos: @videos),
        Yt::VideoAudit::SubscribeEndScreen.new(videos: @videos),
        Yt::VideoAudit::VideoEndScreen.new(videos: @videos),
        Yt::VideoAudit::PlaylistEndScreen.new(videos: @videos),
        Yt::VideoAudit::WebsiteEndScreen.new(videos: @videos)
      ]
    end
  end
end
