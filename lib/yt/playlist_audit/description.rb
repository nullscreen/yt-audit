module Yt
  module PlaylistAudit
    # Count how many playlists have its description.
    class Description
      def initialize(options={})
        @playlists = options[:playlists]
      end

      def total_count
        @playlists.count
      end

      def valid_count
        @playlists.count {|playlist| valid? playlist}
      end

      def title
        'Playlist Description'
      end

      def description
        'The number of playlists with a description'
      end

    private

      def valid?(playlist)
        !playlist.description.empty?
      end
    end
  end
end
