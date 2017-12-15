require_relative 'server_dummy'

#
# Class for testing commands
#
class ConnectionDummy
  attr_reader :method_invocation_log, :server_response_lines, :server_dummy

  def initialize
    @method_invocation_log = []
    @server_response_lines = []
    @server_dummy = ServerDummy.new
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
  end

  def disconnect
    method_invocation_log << [:disconnect]
  end

  # rubocop:disable Style/PerlBackrefs
  def puts(text)
    method_invocation_log << [:puts, text]
    response = case text
               when /^playlistinfo (.*)$/ then server_dummy.playlistinfo($1)
               else "OK\n"
               end
    response_lines = response.split("\n")
    response_lines.pop if response_lines.last == ''
    server_response_lines.concat(response_lines)
  end

  def gets
    method_invocation_log << [:gets]
    (server_response_lines.shift || 'ACK') + "\n"
  end
end
