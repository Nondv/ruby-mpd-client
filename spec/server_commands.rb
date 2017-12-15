Dir[File.join(__dir__, 'server_commands', '*.rb')].each { |f| require f }
