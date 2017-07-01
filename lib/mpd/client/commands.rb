Dir[File.join(__dir__, 'commands', '*.rb')].each { |f| require f }

module MPD
  class Client
    # Module of modules that implement some MPD commands
    module Commands
      constants.each { |mod| Client.include(const_get(mod)) }
    end
  end
end
