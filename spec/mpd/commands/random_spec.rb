require 'spec_helper'

describe MPD::Commands::Random do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(arg) }
  end

  context 'with `true` arg' do
    let(:arg) { true }
    its('connection.sent_text') { should == "random 1\n" }
  end

  context 'with `false` arg' do
    let(:arg) { false }
    its('connection.sent_text') { should == "random 0\n" }
  end
end
