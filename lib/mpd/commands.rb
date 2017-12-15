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

    define_trivial_command(:Pause, 'pause 1')
    define_trivial_command(:Stop, 'stop')
    define_trivial_command(:Previous, 'previous')
    define_trivial_command(:Next, 'next')

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

    %w[Consume Crossfade Random Repeat Single].each do |class_name|
      define_option_command(class_name, class_name.downcase)
    end
  end
end
