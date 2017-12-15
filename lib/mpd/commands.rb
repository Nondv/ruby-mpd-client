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
  end
end
