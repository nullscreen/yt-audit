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
             .any? {|link| channel_id(link) == video.channel_id }
      end

      def channel_id(url)
        Yt::Channel.new(url: url).id
      rescue Yt::Errors::NoItems
      end
    end
  end
end
