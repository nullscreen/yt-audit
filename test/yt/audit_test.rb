require 'test_helper'

class Yt::AuditTest < Minitest::Test

  def setup
    channel_id = 'UCKM-eG7PBcw3flaBvd0q2TQ'
    @channel = Yt::Channel.new(id: channel_id)
  end

  def test_channel_audit
    audit = Yt::Audit.new(channel: @channel)
    result = audit.run

    assert_equal 'Info Cards', result[0].title
    assert_equal 2, result[0].valid_count
    assert_equal 5, result[0].total_count

    assert_equal 'Brand Anchoring', result[1].title
    assert_equal 3, result[1].valid_count
    assert_equal 5, result[1].total_count

    assert_equal 'Subscribe Annotations', result[2].title
    assert_equal 2, result[2].valid_count
    assert_equal 5, result[2].total_count

    assert_equal 'YouTube Association', result[3].title
    assert_equal 2, result[3].valid_count
    assert_equal 5, result[3].total_count

    assert_equal 'Possible End Card Annotations', result[4].title
    assert_equal 1, result[4].valid_count
    assert_equal 5, result[4].total_count

    assert_equal 'Playlist Description', result[5].title
    assert_equal 1, result[5].valid_count
    assert_equal 4, result[5].total_count
  end

  def test_channel_audit_with_videos_argument
    videos = @channel.videos.includes(:snippet).first(4)
    audit = Yt::Audit.new(channel: @channel, videos: videos)
    result = audit.run

    assert_equal 'Info Cards', result[0].title
    assert_equal 4, result[0].total_count

    assert_equal 'Brand Anchoring', result[1].title
    assert_equal 4, result[1].total_count

    assert_equal 'Subscribe Annotations', result[2].title
    assert_equal 4, result[2].total_count

    assert_equal 'YouTube Association', result[3].title
    assert_equal 4, result[3].total_count

    assert_equal 'Possible End Card Annotations', result[4].title
    assert_equal 4, result[4].total_count
  end

  def test_channel_audit_with_playlists_argument
    playlists = @channel.playlists.first(2)
    audit = Yt::Audit.new(channel: @channel, playlists: playlists)
    result = audit.run

    assert_equal 'Playlist Description', result[5].title
    assert_equal 2, result[5].total_count
  end

  def test_channel_audit_with_brand_argument
    audit = Yt::Audit.new(channel: @channel, brand: 'Test')
    result = audit.run

    assert_equal 'Brand Anchoring', result[1].title
    assert_equal 2, result[1].valid_count
    assert_equal 5, result[1].total_count
  end
end
