require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Makes MPD save current playlist
    #
    class PlaylistSave < Abstract
      def execute(name)
        exec_command "save \"#{name}\""
      end
    end
  end
end
