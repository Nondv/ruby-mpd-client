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
        disconnect if socket
        @socket = TCPSocket.open(host, port)
      end

      def disconnect
        socket && socket.close
        @socket = nil
      end

      def puts(text)
        raise ConnectionError unless socket
        socket.puts(text)
      end

      def gets
        raise ConnectionError unless socket
        socket.gets
      end

      private

      attr_reader :socket, :host, :port
    end
  end
end
