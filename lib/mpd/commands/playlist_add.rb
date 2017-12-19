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
        if songs.is_a?(Array)
          commands = songs.map { |s| "playlistadd \"#{name}\" \"#{s}\"" }
          exec_command_list(commands)
        else
          exec_command("playlistadd \"#{name}\" \"#{songs}\"")
        end
      end
    end
  end
end
