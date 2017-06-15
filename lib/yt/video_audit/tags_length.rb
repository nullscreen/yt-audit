require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many subject videos use at least 80% of 500 character limit
    # of tags.
    class TagsLength < Base
      def title
        'Length of Tags'
      end

      def description
        'The number of videos that use at least 80%'\
        ' of the available tags length limit'
      end

    private

      def valid?(video)
        tags_length = video.tags.map {|tag| tag.include?(' ') ? "\"#{tag}\"" : tag }.join(",").length
        tags_length / 500.0 >= 0.8
      end
    end
  end
end
