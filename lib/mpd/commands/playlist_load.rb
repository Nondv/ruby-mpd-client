require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Adds songs from playlist to current playlist
    #
    class PlaylistLoad < Abstract
      def execute(name)
        exec_command "load \"#{name}\""
      end
    end
  end
end
