module MPD
  class Client
    module Commands
      # https://www.musicpd.org/doc/protocol/playback_commands.html
      module PlaybackControl
        def play(position: nil, id: nil)
          raise(ArgumentError, 'too many arguments') if position && id

          if position
            execute "play #{position}"
          elsif id
            execute "playid #{id}"
          else
            execute 'pause 0'
          end
        end

        def pause
          execute 'pause 1'
        end

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
