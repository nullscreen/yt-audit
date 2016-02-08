require 'yt'
require 'yt/annotations'

module Yt
  module Audit
    def self.has_info_cards?(video_id)
      Yt::Annotations.for(video_id).any? do |annotation|
        annotation.is_a? Yt::Annotations::Card
      end
    end

    def self.has_brand_anchoring?(video_id, brand)
      video_title = Yt::Video.new(id: video_id).title
      video_title.include? brand
    end

  private

    def self.card_count(video_ids)
      video_ids.count {|id| has_info_cards? id }
    end

    def self.brand_anchor_count(video_ids, brand)
      video_ids.count {|id| has_brand_anchoring? id, brand }
    end
  end
end
