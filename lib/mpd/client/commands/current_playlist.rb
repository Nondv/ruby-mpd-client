require 'mpd/playlist'

module MPD
  class Client
    module Commands
      # https://www.musicpd.org/doc/protocol/queue.html
      module CurrentPlaylist
        # songs - integer or range
        def playlist_info(songs = nil)
          response = execute "playlistinfo #{resolve_range(songs)}"
          Playlist.from_response(response)
        end

        # `songs` - integer or range
        def remove_song_from_queue(songs)
          execute "delete #{resolve_range(songs)}"
        end

        private

        def resolve_range(arg)
          arg.is_a?(Range) ? "#{arg.begin}:#{arg.end}" : arg
        end
      end
    end
  end
end
