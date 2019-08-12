require 'yt/core'
require 'yt/url'
require 'yt/video_audit/brand_anchoring'
require 'yt/video_audit/youtube_association'
require 'yt/playlist_audit/description'
require 'yt/video_audit/tags_length'

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
        Yt::VideoAudit::BrandAnchoring.new(videos: @videos, brand: @brand),
        Yt::VideoAudit::YoutubeAssociation.new(videos: @videos),
        Yt::PlaylistAudit::Description.new(playlists: @playlists),
        Yt::VideoAudit::TagsLength.new(videos: @videos),
      ]
    end
  end
end
