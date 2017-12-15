require 'spec_helper'

describe MPD::Commands::Play do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(args) }
  end

  describe 'without args' do
    let(:args) { {} }
    its('connection.sent_text') { should == "pause 0\n" }
  end

  describe 'with :id and :position set' do
    let(:args) { { id: 1, position: 1 } }
    it 'raises ArgumentError' do
      expect { subject }.to raise_error ArgumentError
    end
  end

  describe 'with :id set' do
    let(:args) { { id: 1 } }
    its('connection.sent_text') { should == "playid 1\n" }
  end

  describe 'with :position set' do
    let(:args) { { position: 1 } }
    its('connection.sent_text') { should == "play 1\n" }
  end
end
