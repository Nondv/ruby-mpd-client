require 'spec_helper'

describe MPD::Commands::Pause do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap(&:execute)
  end

  its('connection.sent_text') { should == "pause 1\n" }
end
