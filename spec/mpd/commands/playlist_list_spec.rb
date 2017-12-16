require 'spec_helper'

describe MPD::Commands::PlaylistList do
  subject { described_class.new(connection: connection).execute }
  let(:connection) { ConnectionDummy.new }

  it do
    expect(subject).to eq %w[pl1 pl2 pl3]
  end
end
