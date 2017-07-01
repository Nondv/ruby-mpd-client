require 'mpd/client/connection'
require 'mpd/client/server_response'
require 'mpd/client/commands'

module MPD
  class Client
    attr_reader :connection

    def initialize(host: 'localhost', port: 6600)
      @connection = Connection.new(host: host, port: port)
    end

    def status
      response = execute('status')
      response.to_h
    end

    def execute(command)
      ensure_connection_established
      connection.puts(command)
      response = ServerResponse.from_connection(connection)
      raise(MpdError, response.status) if response.error?
      response
    end

    private

    def ensure_connection_established
      return if connection.connected?
      connection.connect
      connection.gets
    end
  end
end
