require 'mpd/playlist'

module MPD
  class Client
    module Commands
      # https://www.musicpd.org/doc/protocol/queue.html
      module CurrentPlaylist
        # songs - integer or range
        def playlist_info(songs = nil)
          argument = songs.is_a?(Range) ? "#{songs.begin}:#{songs.end}" : songs
          response = execute "playlistinfo #{argument}"
          Playlist.from_response(response)
        end
      end
    end
  end
end
