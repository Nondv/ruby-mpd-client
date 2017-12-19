require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Adds song(s) to specific playlist.
    #
    class PlaylistAdd < Abstract
      #
      # @param name [String] playlist name.
      # @param songs [Array<String>, String] file URIs.
      #
      def execute(name, songs)
        return exec_command("playlistadd \"#{name}\" \"#{songs}\"") unless songs.is_a?(Array)
        exec_command_list(songs.map { |s| "playlistadd \"#{name}\" \"#{s}\"" })
      end
    end
  end
end
