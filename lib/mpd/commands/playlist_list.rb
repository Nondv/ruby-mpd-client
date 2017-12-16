require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # List of saved playlists.
    #
    class PlaylistList < Abstract
      def execute
        exec_command('listplaylists')
          .key_value_pairs
          .select { |k, v| k == 'playlist' }
          .map(&:last)
      end
    end
  end
end
