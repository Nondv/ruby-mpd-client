module MPD
  # Hash with predefined structure (see MAPPINGS) created from
  # basic MPD song info
  # Additionaly it stores base data via #data
  class Song < Hash
    MAPPINGS = { file: 'file',
                 artist: 'Artist',
                 album: 'Album',
                 title: 'Title',
                 year: 'Date',
                 genre: 'Genre',
                 id: 'Id',
                 position: 'Pos',
                 time: 'Time' }.freeze

    attr_reader :data

    def initialize(data)
      super()
      @data = data
      MAPPINGS.each { |key, data_key| self[key] = data[data_key] }
    end

    MAPPINGS.each do |method_name, data_key|
      define_method(method_name) { data[data_key] }
    end
  end
end
