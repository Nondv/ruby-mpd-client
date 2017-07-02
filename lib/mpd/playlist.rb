require 'mpd/song'

module MPD
  # Array<SongInfo> with some useful methods
  class Playlist < Array
    def self.from_response(response)
      data = []
      info = {}
      response.key_value_pairs.each do |key, value|
        if info.key?(key) # next song info
          data << info
          info = {}
        end

        info[key] = value
      end

      data << info
      new(data)
    end

    # data - array of hashes from MPD
    def initialize(data)
      super(data.map { |info| Song.new(info) })
    end
  end
end
