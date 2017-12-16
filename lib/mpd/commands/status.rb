require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Player status
    #
    class Status < Abstract
      def execute
        super('status').to_h
      end
    end
  end
end
