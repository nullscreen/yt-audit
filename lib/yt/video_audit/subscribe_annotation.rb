require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have an annotation
    # with a subscribe link.
    class SubscribeAnnotation < Base
      def title
        'Subscribe Annotations'
      end

      def description
        'The number of videos with a link to subscribe in its annotations'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          annotation.link && annotation.link[:type] == :subscribe
        end
      end
    end
  end
end
