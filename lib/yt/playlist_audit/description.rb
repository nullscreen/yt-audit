module Yt
  module PlaylistAudit
    # Count how many playlists have its description.
    class Description
      def initialize(playlists:)
        @playlists = playlists
      end

      def total_count
        @playlists.size
      end

      def valid_count
        @playlists.count {|playlist| valid? playlist}
      end

      def title
        'Playlist Description'
      end

      def description
        'The number of playlists with description'
      end

    private

      def valid?(playlist)
        !playlist.description.empty?
      end
    end
  end
end
