require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Info about songs in current playlist
    #
    class CurrentPlaylistInfo < Abstract
      # `songs` can be range
      # or integer (to show info about one song)
      # or completely ommited (to show info about all songs)
      def execute(songs = nil)
        response = super("playlistinfo #{resolve_range(songs)}")
        Playlist.from_response(response)
      end
    end
  end
end
