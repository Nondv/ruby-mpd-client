require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Play specific song (by id or cur. playlist position).
    #
    #
    class Play < Abstract
      def execute(position: nil, id: nil)
        raise(ArgumentError, 'too many arguments') if position && id

        if position
          super("play #{position}")
        elsif id
          super("playid #{id}")
        else
          super('pause 0')
        end
      end
    end
  end
end
