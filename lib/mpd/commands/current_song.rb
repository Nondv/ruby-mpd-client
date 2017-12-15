require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Current song info as hash
    #
    class CurrentSong < Abstract
      def execute
        super('currentsong').to_h
      end
    end
  end
end
