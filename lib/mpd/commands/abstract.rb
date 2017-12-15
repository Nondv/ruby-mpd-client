require 'mpd/connection'
require 'mpd/server_response'
require 'mpd/playlist'

module MPD
  module Commands
    #
    # Base class for MPD commands.
    #
    class Abstract
      attr_reader :connection

      #
      # You can provide you own connection. It should have same
      #
      def initialize(connection: nil, host: 'localhost', port: 6600)
        @connection = connection || Connection.new(host: host, port: port).tap(&:connect)
      end

      #
      # This method should be overriden.
      # Example:
      #
      #     def execute
      #       super('ping')
      #     end
      #
      def execute(command)
        connection.puts(command)
        response = ServerResponse.from_connection(connection)
        raise(MpdError, response.status) if response.error?
        response
      end

      private

      def resolve_range(arg)
        if arg.is_a?(Range)
          last = arg.exclude_end? ? arg.end : arg.end + 1
          "#{arg.begin}:#{last}"
        else
          arg
        end
      end
    end
  end
end
