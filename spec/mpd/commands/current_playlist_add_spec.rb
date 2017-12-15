require 'spec_helper'

describe MPD::Commands::CurrentPlaylistAdd do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(songs) }
  end

  describe 'with one song' do
    let(:songs) { 'song1.mp3' }
    its('connection.sent_text') { should == "add song1.mp3\n" }
  end

  describe 'with multiple songs' do
    let(:songs) { ['song1.mp3', 'song2.mp3', 'song3.mp3'] }
    its('connection.sent_text') do
      should == "command_list_begin\nadd song1.mp3\nadd song2.mp3\nadd song3.mp3\ncommand_list_end\n"
    end
  end
end
