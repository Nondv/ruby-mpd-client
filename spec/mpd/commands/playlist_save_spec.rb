require 'spec_helper'

describe MPD::Commands::PlaylistSave do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(name) }
  end

  let(:name) { 'whatever' }

  its('connection.sent_text') { should == "save \"#{name}\"\n" }
end
