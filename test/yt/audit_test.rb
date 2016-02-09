require 'test_helper'
require 'yt/audit'

class Yt::AuditTest < Minitest::Test
  def setup
    @good_channel_id = 'UCPCk_8dtVyR1lLHMBEILW4g'
    @good_video_id = 'rF711XAtrVg' # temporarily use Budweiser

    @bad_channel_id = 'UCQA5651nwDwKP2oLwv8hTkw'
    @bad_video_id = 'Cq_Qo0uaIbI'
  end

  def test_has_brand_anchoring
    assert_equal true, Yt::Audit.has_brand_anchoring?(@good_video_id, 'Budweiser')
  end

  def test_does_not_have_brand_anchoring
    assert_equal false, Yt::Audit.has_brand_anchoring?(@bad_video_id, 'Budweiser')
  end

  def test_has_info_cards
    assert_equal true, Yt::Audit.has_info_cards?(@good_video_id)
  end

  def test_does_not_have_info_cards
    assert_equal false, Yt::Audit.has_info_cards?(@bad_video_id)
  end

  def test_invalid_video_id
    assert_raises(NoMethodError) { Yt::Audit.has_info_cards?('') }
    assert_raises(Yt::Errors::NoItems) { Yt::Audit.has_brand_anchoring?('', '') }
  end
end
