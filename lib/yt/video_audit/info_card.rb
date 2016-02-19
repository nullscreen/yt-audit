require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have an info card.
    class InfoCard < Base
      def title
        'Info Cards'
      end

      def description
        'The number of videos with an info card'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          annotation.is_a? Yt::Annotations::Card
        end
      end
    end
  end
end
