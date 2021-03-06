module MPD
  #
  # Just a frozen string with some useful methods
  #
  class ServerResponse < String
    # Reads data from `MPD::Connection` instance to next OK/ACK
    def self.from_connection(conn)
      line = ''
      buffer = ''
      while line != "OK\n" && !line.start_with?('ACK')
        line = conn.gets
        raise(ConnectionError) if line.nil?
        buffer << line
      end

      new(buffer.force_encoding('UTF-8'))
    end

    def initialize(response_text)
      super
      freeze
    end

    def to_h
      key_value_pairs.to_h
    end

    #
    # MPD often sends data as:
    #
    #     id: 1
    #     title: some title
    #     id: 2
    #     title: another title
    #
    # So this method comes useful.
    #
    def key_value_pairs
      content.split("\n").map do |line|
        index = line.index(':')
        raise "can't create key-value pair" unless index
        key = line[0...index]
        value = line[(index + 1)..-1].strip
        [key, value]
      end
    end

    # text without status
    def content
      lines[0..-2].join
    end

    # last line of response
    def status
      lines.last.chomp
    end

    def error?
      status.start_with?('ACK')
    end
  end
end
