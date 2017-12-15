require 'socket'

module MPD
  #
  # Simple wrapper over Socket
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
    rescue Errno::ECONNRESET
      raise ConnectionError
    end

    def gets
      raise ConnectionError unless socket
      socket.gets || raise(ConnectionError)
    rescue Errno::ECONNRESET
      raise ConnectionError
    end

    private

    attr_reader :socket, :host, :port
  end
end
