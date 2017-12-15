require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Set specific volume to specific value
    #
    class SetVolume < Abstract
      def execute(n)
        super("setvol #{n}")
      end
    end
  end
end
