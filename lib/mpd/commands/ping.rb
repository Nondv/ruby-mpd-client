require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Tries to execute "ping" command.
    # Returns `true` if succedeed,
    # raises error if `MpdError` occurred,
    # `false` otherwise
    #
    class Ping < Abstract
      def execute
        super('ping')
        true
      rescue StandardError => e
        raise e if e.is_a?(MpdError)
        false
      end
      # rubocop:enable Lint/RescueWithoutErrorClass
    end
  end
end
