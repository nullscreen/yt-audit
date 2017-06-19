require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have a branding.
    class InvideoProgramming < Base
      def title
        'In-Video Programming'
      end

      def description
        'The number of videos with an in-video programming'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          annotation.instance_of? Yt::Annotations::Branding
        end
      end
    end
  end
end
