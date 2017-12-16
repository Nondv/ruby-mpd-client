require 'spec_helper'

describe MPD::Commands::PlaylistAdd do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(name, songs) }
  end

  let(:name) { 'my playlist' }

  describe 'with one song' do
    let(:songs) { 'song1.mp3' }
    its('connection.sent_text') { should == "playlistadd \"#{name}\" \"song1.mp3\"\n" }
  end

  describe 'with multiple songs' do
    let(:songs) { ['song1.mp3', 'song2.mp3', 'song3.mp3'] }
    its('connection.sent_text') do
      should == "command_list_begin\n" \
                "playlistadd \"#{name}\" \"song1.mp3\"\n" \
                "playlistadd \"#{name}\" \"song2.mp3\"\n" \
                "playlistadd \"#{name}\" \"song3.mp3\"\n" \
                "command_list_end\n"
    end
  end
end
