require 'spec_helper'

describe MPD::Commands::Status do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap(&:execute)
  end

  its('connection.sent_text') { should == "status\n" }
end
