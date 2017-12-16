require 'spec_helper'

describe MPD::Commands::Ping do
  subject do
    described_class.new(connection: connection).execute
  end

  context 'when connected' do
    let(:connection) { ConnectionDummy.new }
    it { should be true }
  end

  context 'when disconnected' do
    let(:connection) { ConnectionDummy.new(connected: false) }
    it { should be false }
  end
end
