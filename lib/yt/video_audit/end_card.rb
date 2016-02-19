require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos have any end card. An end card
    # can be described as an annotation, not an info card, with a link in it,
    # at the end of video, stays for more than 5 seconds.
    class EndCard < Base
      def title
        'Possible End Card Annotations'
      end

      def description
        'The number of videos with a link annotation'\
        ' longer than 5 seconds, not an info card, at the end of its duration'
      end

    private

      def valid?(video)
        Yt::Annotations.for(video.id).any? do |annotation|
          !annotation.is_a?(Yt::Annotations::Card) && annotation.link &&
            (annotation.ends_at.floor..annotation.ends_at.ceil).include?(video.duration) &&
            video.duration - annotation.starts_at > 5
        end
      end
    end
  end
end
