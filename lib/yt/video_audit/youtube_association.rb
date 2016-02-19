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
        'The number of videos with description has a link to its own channel'
      end

    private

      def valid?(video)
        video.description.split(' ')
             .select {|word| Yt::URL.new(word).kind == :channel }
             .any? {|link| Yt::Channel.new(url: link).id == video.channel_id }
      end
    end
  end
end
