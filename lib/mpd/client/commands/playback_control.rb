module MPD
  class Client
    module Commands
      # https://www.musicpd.org/doc/protocol/playback_commands.html
      module PlaybackControl
        def stop
          execute 'stop'
        end

        def previous
          execute 'previous'
        end

        def next
          execute 'next'
        end
      end
    end
  end
end
