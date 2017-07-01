module MPD
  class Client
    module Commands
      # https://www.musicpd.org/doc/protocol/playback_option_commands.html
      module PlaybackOptions
        def consume(state)
          execute "consume #{state ? 1 : 0}"
        end

        def crossfade(state)
          execute "crossfade #{state ? 1 : 0}"
        end

        def random(state)
          execute "random #{state ? 1 : 0}"
        end

        def repeat(state)
          execute "repeat #{state ? 1 : 0}"
        end

        def single(state)
          execute "single #{state ? 1 : 0}"
        end

        def volume(val)
          execute "setvol #{val}"
        end

        def change_volume_by(val)
          execute("volume #{val}")
        end
      end
    end
  end
end
