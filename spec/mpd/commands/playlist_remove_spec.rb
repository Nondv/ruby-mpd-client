require 'spec_helper'

describe MPD::Commands::PlaylistRemove do
  subject do
    described_class.new(connection: ConnectionDummy.new)
                   .tap { |c| c.execute(name, positions) }
  end

  let(:name) { 'my playlist' }

  describe 'with one position' do
    let(:positions) { 3 }
    its('connection.sent_text') do
      should == "playlistdelete \"#{name}\" #{positions}\n"
    end
  end

  describe 'with multiple positions' do
    # MPD has only one way to delete songs from playlist - by position.
    # Suppose you want to delete positions 1 and 2.
    # If you delete first, then second will become first.
    # So should you delete first twice or just delete them from
    # biggest position to lowest?
    pending 'deletes multiple songs minding position changes'
  end
end
