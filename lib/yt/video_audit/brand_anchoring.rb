require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos include its brand name in the title.
    class BrandAnchoring < Base
      def initialize(options = {})
        super
        @brand = options[:brand]
      end

      def title
        'Brand Anchoring'
      end

      def description
        'The number of videos with the brand name in the title'
      end

    private

      def valid?(video)
        !!video.title[/#{@brand}/i]
      end
    end
  end
end
