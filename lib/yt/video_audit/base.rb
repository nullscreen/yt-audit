module Yt
  module VideoAudit
    class Base
      def initialize(options = {})
        @videos = options[:videos]
      end

      # @return [Fixnum] number of all given videos.
      def total_count
        @videos.size
      end

      # @return [Fixnum] number of videos satisfy given condition.
      def valid_count
        @videos.count {|video| valid? video}
      end
    end
  end
end
