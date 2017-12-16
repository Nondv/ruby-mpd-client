require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Info about songs in specific playlist.
    # MPD command: "listplaylistinfo <NAME>"
    #
    class PlaylistInfo < Abstract
      # `songs` can be range
      # or integer (to show info about one song)
      # or completely ommited (to show info about all songs)
      def execute(name)
        response = super("listplaylistinfo \"#{name}\"")
        Playlist.from_response(response)
      end
    end
  end
end
