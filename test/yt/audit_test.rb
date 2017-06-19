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
    assert_equal "The number of videos with an info card", result[0].description
    assert_equal 2, result[0].valid_count
    assert_equal 7, result[0].total_count

    assert_equal 'Brand Anchoring', result[1].title
    assert_equal "The number of videos with the brand name in the title", result[1].description
    assert_equal 3, result[1].valid_count
    assert_equal 7, result[1].total_count

    assert_equal 'Subscribe Annotations', result[2].title
    assert_equal "The number of videos with a link to subscribe in its annotations", result[2].description
    assert_equal 3, result[2].valid_count
    assert_equal 7, result[2].total_count

    assert_equal 'YouTube Association', result[3].title
    assert_equal "The number of videos with description has a link to its own channel", result[3].description
    assert_equal 2, result[3].valid_count
    assert_equal 7, result[3].total_count

    assert_equal 'Possible End Card Annotations', result[4].title
    assert_equal "The number of videos with a link annotation longer than 5 seconds, not an info card, at the end of its duration", result[4].description
    assert_equal 3, result[4].valid_count
    assert_equal 7, result[4].total_count

    assert_equal 'Playlist Description', result[5].title
    assert_equal "The number of playlists with description", result[5].description
    assert_equal 1, result[5].valid_count
    assert_equal 4, result[5].total_count

    assert_equal 'Length of Tags', result[7].title
    assert_equal "The number of videos that use at least 80\% of the available tags length limit", result[7].description
    assert_equal 1, result[7].valid_count
    assert_equal 7, result[7].total_count

    assert_equal 'End Screens', result[6].title
    assert_equal "The number of videos with at least one end screen element", result[6].description
    assert_equal 2, result[6].valid_count
    assert_equal 7, result[6].total_count

    assert_equal 'Subscribe End Screens', result[8].title
    assert_equal "The number of videos with any link to subscribe in its end screens", result[8].description
    assert_equal 1, result[8].valid_count
    assert_equal 7, result[8].total_count

    assert_equal 'Video End Screens', result[9].title
    assert_equal "The number of videos with any link to a video in its end screens", result[9].description
    assert_equal 2, result[9].valid_count
    assert_equal 7, result[9].total_count

    assert_equal 'Playlist End Screens', result[10].title
    assert_equal "The number of videos with any link to a playlist in its end screens", result[10].description
    assert_equal 1, result[10].valid_count
    assert_equal 7, result[10].total_count

    assert_equal 'Website End Screens', result[11].title
    assert_equal "The number of videos with any external link in its end screens", result[11].description
    assert_equal 1, result[11].valid_count
    assert_equal 7, result[11].total_count

    assert_equal 'In-Video Programming', result[12].title
    assert_equal "The number of videos with an in-video programming", result[12].description
    assert_equal 6, result[12].valid_count
    assert_equal 7, result[12].total_count
  end

  def test_channel_audit_with_videos_argument
    videos = @channel.videos.select(:snippet).first(4)
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
    assert_equal 7, result[1].total_count
  end
end
