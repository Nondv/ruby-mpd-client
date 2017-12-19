require_relative 'server_dummy'

#
# Class for testing commands
#
class ConnectionDummy
  attr_reader :method_invocation_log, :server_response_lines, :server_dummy,
              :connected

  def initialize(connected: true)
    @method_invocation_log = []
    @server_response_lines = []
    @server_dummy = ServerDummy.new
    @connected = connected
  end

  def sent_text
    method_invocation_log
      .select { |e| e[0] == :puts }
      .reduce('') { |a, e| a + e[1] + "\n" }
  end

  #
  # Implement Connection interface
  #

  def connect
    method_invocation_log << [:connect]
    @connected = true
  end

  def disconnect
    method_invocation_log << [:disconnect]
    @connected = false
  end

  # rubocop:disable Style/PerlBackrefs, Metrics/MethodLength, Metrics/AbcSize
  def puts(text)
    method_invocation_log << [:puts, text]
    raise MPD::ConnectionError unless connected
    response = case text
               when /^playlistinfo (.*)$/ then server_dummy.playlistinfo($1)
               when /^listall$/ then server_dummy.listall
               when /^listplaylists$/ then server_dummy.listplaylists
               else "OK\n"
               end
    response_lines = response.split("\n")
    response_lines.pop if response_lines.last == ''
    server_response_lines.concat(response_lines)
  end
  # rubocop:enable Style/PerlBackrefs, Metrics/MethodLength, Metrics/AbcSize

  def gets
    method_invocation_log << [:gets]
    raise MPD::ConnectionError unless connected
    (server_response_lines.shift || 'ACK') + "\n"
  end
end
