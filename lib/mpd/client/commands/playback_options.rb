module MPD
  class Client
    module Commands
      # https://www.musicpd.org/doc/protocol/playback_option_commands.html
      module PlaybackOptions
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
