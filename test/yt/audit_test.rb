require 'test_helper'

class Yt::AuditTest < Minitest::Test

  def setup
    channel_id = 'UCKM-eG7PBcw3flaBvd0q2TQ'
    @channel = Yt::Channel.new(id: channel_id)
  end

  def test_channel_audit
    audit = Yt::Audit.new(channel: @channel)
    result = audit.run

    assert_equal 'Brand Anchoring', result[0].title
    assert_equal "The number of videos with the brand name in the title", result[0].description
    assert_equal 3, result[0].valid_count
    assert_equal 7, result[0].total_count

    assert_equal 'YouTube Association', result[1].title
    assert_equal "The number of videos where the description has a link to its own channel", result[1].description
    assert_equal 2, result[1].valid_count
    assert_equal 7, result[1].total_count

    assert_equal 'Playlist Description', result[2].title
    assert_equal "The number of playlists with a description", result[2].description
    assert_equal 1, result[2].valid_count
    assert_equal 4, result[2].total_count

    assert_equal 'Length of Tags', result[3].title
    assert_equal "The number of videos that use at least 80\% of the available tags length limit", result[3].description
    assert_equal 1, result[3].valid_count
    assert_equal 7, result[3].total_count
  end

  def test_channel_audit_with_videos_argument
    videos = @channel.videos.select(:snippet).first(4)
    audit = Yt::Audit.new(channel: @channel, videos: videos)
    result = audit.run

    assert_equal 'Brand Anchoring', result[0].title
    assert_equal 4, result[0].total_count

    assert_equal 'YouTube Association', result[1].title
    assert_equal 4, result[1].total_count
  end

  def test_channel_audit_with_playlists_argument
    playlists = @channel.playlists.first(2)
    audit = Yt::Audit.new(channel: @channel, playlists: playlists)
    result = audit.run

    assert_equal 'Playlist Description', result[2].title
    assert_equal 2, result[2].total_count
  end

  def test_channel_audit_with_brand_argument
    audit = Yt::Audit.new(channel: @channel, brand: 'Test')
    result = audit.run

    assert_equal 'Brand Anchoring', result[0].title
    assert_equal 2, result[0].valid_count
    assert_equal 7, result[0].total_count
  end
end
