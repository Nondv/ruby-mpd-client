require 'mpd/client/connection'
require 'mpd/client/server_response'
require 'mpd/client/commands'

module MPD
  class Client
    def self.connect(host: 'localhost', port: 6600)
      new(host: host, port: port).tap(&:connect)
    end

    def initialize(host: 'localhost', port: 6600)
      @connection = Connection.new(host: host, port: port)
    end

    def current_song
      execute('currentsong').to_h
    end

    def status
      response = execute('status')
      response.to_h
    end

    def execute(command)
      connection.puts(command)
      response = ServerResponse.from_connection(connection)
      raise(MpdError, response.status) if response.error?
      response
    end

    def connected?
      execute('ping')
    rescue => e
      raise e if e.is_a?(MpdError)
      false
    end

    def connect
      connection.connect
      raise(ConnectionError) unless connection.gets =~ /^OK/
    end

    def disconnect
      connection.disconnect
    end

    private

    attr_reader :connection
  end
end
