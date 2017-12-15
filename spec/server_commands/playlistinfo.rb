module ServerCommands
  # playlistinfo [pos|begin:end]
  class Playlistinfo
    attr_reader :arg, :playlist

    def initialize(arg, playlist)
      @arg = arg
      @playlist = playlist
    end

    def execute
      r = arg_to_range
      return "ACK playlistinfo\n" unless r
      result = playlist[r].compact.map { |s| s.map { |k, v| "#{k}: #{v}" } }.flatten.join("\n")
      result + "\nOK\n"
    end

    private

    def arg_to_range
      numbers = arg.split(':').map(&:to_i)

      if numbers.empty?
        0...playlist.size
      elsif numbers.size == 2
        numbers[0]...numbers[1]
      elsif numbers.size == 1
        numbers[0]..numbers[0]
      end
    end
  end
end
