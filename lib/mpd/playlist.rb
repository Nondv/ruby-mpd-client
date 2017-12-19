require 'mpd/song'

module MPD
  # Array<SongInfo> with some useful methods
  class Playlist < Array
    def self.from_response(response)
      data = [{}]
      response.key_value_pairs.each do |k, v|
        data.push({}) if data.last.key?(k) # next song reached
        data.last[k] = v
      end
      new(data)
    end

    # data - array of hashes from MPD
    def initialize(data)
      super(data.map { |info| Song.new(info) })
    end
  end
end
