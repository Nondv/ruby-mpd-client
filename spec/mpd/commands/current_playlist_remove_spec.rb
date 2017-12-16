require 'spec_helper'

describe MPD::Commands::CurrentPlaylistRemove do
  subject do
    described_class.new(connection: connection).tap { |c| c.execute(arg) }
  end

  let(:connection) { ConnectionDummy.new }

  context 'when both args are set' do
    let(:arg) { { position: 1, id: 1 } }

    it 'raises ArgumentError' do
      expect { subject }.to raise_error ArgumentError
    end
  end

  context 'when both args ommited' do
    let(:arg) { {} }

    it 'raises ArgumentError' do
      expect { subject }.to raise_error ArgumentError
    end
  end

  context 'when id set' do
    let(:arg) { { id: 3 } }
    its('connection.sent_text') { should == "deleteid 3\n" }
  end

  context 'when :position set as int' do
    let(:arg) { { position: 3 } }
    its('connection.sent_text') { should == "delete 3\n" }
  end

  context 'when :position set as range' do
    let(:arg) { { position: 3..5 } }
    its('connection.sent_text') { should == "delete 3:6\n" }
  end
end
