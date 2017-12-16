require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Increases/decreases volume by some number
    #
    class ChangeVolume < Abstract
      def execute(n)
        super("volume #{n}")
      end
    end
  end
end
