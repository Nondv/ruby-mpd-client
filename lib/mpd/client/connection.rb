require 'socket'

module MPD
  class Client
    #
    # It's `Client`'s internal class. Don't use it outside `Client`
    #
    class Connection
      def initialize(host:, port:)
        @host = host
        @port = port
      end

      def connect
        @socket = TCPSocket.open(host, port)
      end

      def puts(text)
        raise ConnectionError unless connected?
        socket.puts(text)
      end

      def gets
        raise ConnectionError unless connected?
        socket.gets
      end

      def connected?
        socket && !socket.closed?
      rescue
        false
      end

      private

      attr_reader :socket, :host, :port
    end
  end
end
