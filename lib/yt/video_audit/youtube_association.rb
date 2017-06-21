require 'yt/video_audit/base'

module Yt
  module VideoAudit
    # Count how many videos have video description includes
    # a link to its own channel.
    class YoutubeAssociation < Base
      def title
        'YouTube Association'
      end

      def description
        'The number of videos where the description has a link to its own channel'
      end

    private

      def valid?(video)
        video.description.split(' ').any? do |word|
          if Yt::URL::CHANNEL_PATTERNS.any?{|pattern| word.match pattern}
            url = Yt::URL.new word
            url.kind == :channel && channel_id(url) == video.channel_id
          end
        end
      end

      def channel_id(url)
        url.id
      rescue Yt::NoItemsError
      end
    end
  end
end
