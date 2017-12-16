require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Deletes playlist.
    #
    class PlaylistDelete < Abstract
      def execute(name)
        exec_command "rm \"#{name}\""
      end
    end
  end
end
