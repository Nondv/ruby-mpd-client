require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Adds song(s) to specific playlist
    # `songs` is an array of URIs.
    #
    class PlaylistAdd < Abstract
      #
      # `name` is playlist name.
      # `songs` is position (as int) or range.
      #
      def execute(name, songs)
        return exec_command("playlistadd \"#{name}\" \"#{songs}\"") unless songs.is_a?(Array)
        exec_command_list(songs.map { |s| "playlistadd \"#{name}\" \"#{s}\"" })
      end
    end
  end
end
