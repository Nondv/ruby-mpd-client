require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Removes songs from current playlist
    #
    class CurrentPlaylistRemove < Abstract
      #
      # `songs` is position (as int) or range
      #
      def execute(songs)
        super("delete #{resolve_range(songs)}")
      end
    end
  end
end
