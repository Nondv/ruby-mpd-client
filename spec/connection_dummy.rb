#
# Class for testing commands
#
class ConnectionDummy
  attr_reader :method_invocation_log

  def initialize
    @method_invocation_log = []
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

  def puts(text)
    method_invocation_log << [:puts, text]
  end

  def gets
    method_invocation_log << [:gets]
    "OK\n"
  end
end
