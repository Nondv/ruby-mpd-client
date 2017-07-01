module MPD
  class Client
    #
    # Just a frozen string with some useful methods
    #
    class ServerResponse < String
      def self.from_connection(conn)
        line = ''
        buffer = []
        while line != "OK\n" && !line.start_with?('ACK')
          line = conn.gets
          raise(ConnectionError) if line.nil?
          buffer << line
        end

        new(buffer.join)
      end

      def initialize(response_text)
        super
        freeze
      end

      def to_h
        key_value_pairs.to_h
      end

      def key_value_pairs
        content.split("\n").map { |line| line.split.map(&:strip) }
      end

      # text without status
      def content
        lines[0..-2].join
      end

      def status
        lines.last.chomp
      end

      def error?
        status.start_with?('ACK')
      end
    end
  end
end