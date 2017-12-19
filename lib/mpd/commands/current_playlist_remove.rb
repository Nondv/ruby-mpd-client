require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Removes songs from current playlist
    # by id or position/range
    #
    class CurrentPlaylistRemove < Abstract
      #
      # `position` is int or range
      # `id` is int song id
      #
      def execute(position: nil, id: nil)
        raise(ArgumentError) if position && id || !position && !id
        command = id ? "deleteid #{id}" : "delete #{resolve_range(position)}"
        exec_command(command)
      end
    end
  end
end
