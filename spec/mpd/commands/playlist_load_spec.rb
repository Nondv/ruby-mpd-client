require 'spec_helper'

describe MPD::Commands::PlaylistLoad do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(name) }
  end

  let(:name) { 'whatever' }

  its('connection.sent_text') { should == "load \"#{name}\"\n" }
end
