require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have any end screen.
    class EndScreen < Base
      def title
        'End Screens'
      end

      def description
        'The number of videos with at least one end screen'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          annotation.instance_of? Yt::Annotations::EndScreen
        end
      end
    end
  end
end
