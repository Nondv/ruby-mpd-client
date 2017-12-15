require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Adds song(s) to current playlist
    # `songs` is an array of URIs.
    #
    class CurrentPlaylistAdd < Abstract
      #
      # `songs` is position (as int) or range
      #
      def execute(songs)
        return exec_command("add \"#{songs}\"") unless songs.is_a?(Array)
        exec_command_list(songs.map { |s| "add \"#{s}\"" })
      end
    end
  end
end
