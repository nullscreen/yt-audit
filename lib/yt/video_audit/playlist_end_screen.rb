require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have an end screen
    # with a playlist link.
    class PlaylistEndScreen < Base
      def title
        'Playlist End Screens'
      end

      def description
        'The number of videos with any link to a playlist in its end screens'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          annotation.instance_of?(Yt::Annotations::EndScreen) &&
          annotation.link && annotation.link[:type] == :playlist
        end
      end
    end
  end
end
