require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have an end screens
    # with a video link.
    class VideoEndScreen < Base
      def title
        'Video End Screens'
      end

      def description
        'The number of videos with any link to a video in its end screens'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          annotation.instance_of?(Yt::Annotations::EndScreen) &&
          annotation.link && annotation.link[:type] == :video
        end
      end
    end
  end
end
