require 'spec_helper'

describe MPD::Commands::PlaylistDelete do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(name) }
  end

  let(:name) { 'whatever' }

  its('connection.sent_text') { should == "rm \"#{name}\"\n" }
end
