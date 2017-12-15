require 'spec_helper'

describe MPD::Commands::CurrentPlaylistInfo do
  subject { described_class.new(connection: connection).execute(arg) }
  let(:connection) { ConnectionDummy.new }

  describe 'with int arg' do
    let(:arg) { 1 }

    it 'works' do
      expect(subject.class).to be MPD::Playlist
      expect(subject.size).to eq 1

      exp = MPD::Song.new(ServerDummy::CURRENT_PLAYLIST[1])
      expect(subject[0]).to eq exp
    end
  end

  describe 'with range arg' do
    let(:arg) { 1..3 }

    it 'works' do
      expect(subject.class).to be MPD::Playlist
      expect(subject.size).to eq 3
    end
  end

  describe 'without arg' do
    let(:arg) { nil }

    it 'works' do
      expect(subject.class).to be MPD::Playlist
      expect(subject.size).to eq ServerDummy::CURRENT_PLAYLIST.size
    end
  end
end
