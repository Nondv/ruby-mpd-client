require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Removes **one** song from playlist by position.
    # Uses MPD command "playlistdelete"
    #
    class PlaylistRemove < Abstract
      #
      # @param name [String] playlist name.
      # @param position [Integer] song position.
      #
      def execute(name, position)
        exec_command("playlistdelete \"#{name}\" #{position}")
      end
    end
  end
end
