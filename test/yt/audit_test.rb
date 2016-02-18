require 'test_helper'
require 'yt/audit'

class Yt::AuditTest < Minitest::Test
  def setup
    @good_video_id = 'zPQxhP4KDdg'
    @bad_video_id = 'h5HrvPJGkL4'
  end

  def test_has_brand_anchoring
    assert_equal true, Yt::Audit.has_brand_anchoring?(@good_video_id, 'Audit Good')
  end

  def test_brand_name_not_case_sensitive
    assert_equal true, Yt::Audit.has_brand_anchoring?(@good_video_id, 'AudiT GOod')
  end

  def test_does_not_have_brand_anchoring
    assert_equal false, Yt::Audit.has_brand_anchoring?(@bad_video_id, 'Audit Good')
  end

  def test_has_info_cards
    assert_equal true, Yt::Audit.has_info_cards?(@good_video_id)
  end

  def test_does_not_have_info_cards
    assert_equal false, Yt::Audit.has_info_cards?(@bad_video_id)
  end

  def test_has_subscribe_annotations
    assert_equal true, Yt::Audit.has_subscribe_annotations?(@good_video_id)
  end

  def test_does_not_have_subscribe_annotations
    assert_equal false, Yt::Audit.has_subscribe_annotations?(@bad_video_id)
  end

  def test_has_youtube_association
    assert_equal true, Yt::Audit.has_link_to_own_channel?(@good_video_id)
  end

  def test_does_not_have_youtube_association
    assert_equal false, Yt::Audit.has_link_to_own_channel?(@bad_video_id)
  end

  def test_has_end_cards
    assert_equal true, Yt::Audit.has_end_cards?(@good_video_id)
  end

  def test_does_not_have_end_cards
    assert_equal false, Yt::Audit.has_end_cards?(@bad_video_id)
  end

  def test_has_end_cards_ends_after_video_duration
    assert_equal true, Yt::Audit.has_end_cards?("Hskp8OlCTwU")
  end

  def test_for
    audit = Yt::Audit.for('UCKM-eG7PBcw3flaBvd0q2TQ')
    assert_equal 4, audit.videos_count
    assert_equal 2, audit.info_card_count
    assert_equal 2, audit.brand_anchor_count
    assert_equal 2, audit.subscribe_count
    assert_equal 2, audit.association_count
    assert_equal 1, audit.end_card_count
  end

  def test_audit_attributes_are_not_setters
    audit = Yt::Audit.for('UCKM-eG7PBcw3flaBvd0q2TQ')
    assert_raises NoMethodError do
      audit.videos_count = 11
    end
  end
end
