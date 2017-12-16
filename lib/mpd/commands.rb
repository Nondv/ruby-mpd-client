Dir[File.join(__dir__, 'commands', '*.rb')].each { |f| require f }

module MPD
  #
  # Contains classes representing MPD commands
  #
  module Commands
    #
    # To decrease code amount
    #
    def self.define_trivial_command(class_name, command)
      klass = Class.new(::MPD::Commands::Abstract) do
        define_method :execute do
          super(command)
        end
      end

      const_set(class_name, klass)
    end

    #
    # To define commands like 'save "whatever this is"'
    #
    def self.define_text_argument_command(class_name, command)
      klass = Class.new(::MPD::Commands::Abstract) do
        define_method :execute do |arg|
          super("#{command} \"#{arg}\"")
        end
      end

      const_set(class_name, klass)
    end

    #
    # To define commands like "random <1/0>"
    #
    def self.define_option_command(class_name, command)
      klass = Class.new(::MPD::Commands::Abstract) do
        define_method :execute do |state|
          super(command + state ? ' 1' : ' 0')
        end
      end

      const_set(class_name, klass)
    end

    # @!macro [attach] define_trivial_command
    #   @!parse
    #     # Sends "$2" to MPD.
    #     class Commands::$1; end
    define_trivial_command('Pause', 'pause 1')
    define_trivial_command('Stop', 'stop')
    define_trivial_command('Previous', 'previous')
    define_trivial_command('Next', 'next')
    define_trivial_command('CurrentPlaylistClear', 'clear')

    # @!macro [attach] define_text_argument_command
    #   @!parse
    #     # Sends '$2 "<ARGUMENT>"' to MPD
    #     class Commands::$1; end
    define_text_argument_command 'PlaylistDelete', :rm
    define_text_argument_command 'PlaylistSave', :save
    define_text_argument_command 'PlaylistLoad', :load
    define_text_argument_command 'PlaylistClear', :playlistclear

    # @!macro [attach] define_option_command
    #   @!parse
    #     # Sends '$2 <1/0>' to MPD
    #     class Commands::$1
    #       # @param state [Boolean]
    #       def execute(state); end
    #     end
    define_option_command 'Consume', 'consume'
    define_option_command 'Crossfade', 'crossfade'
    define_option_command 'Random', 'random'
    define_option_command 'Repeat', 'repeat'
    define_option_command 'Single', 'single'
  end
end
