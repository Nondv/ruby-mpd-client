require 'spec_helper'

describe MPD::Commands::AllFiles do
  subject { described_class.new(connection: connection).execute }
  let(:connection) { ConnectionDummy.new }

  it do
    expect(subject).to eq ['12 Stones/12 Stones/01 Crash.m4a',
                           '12 Stones/12 Stones/02 Broken.m4a',
                           '12 Stones/12 Stones/03 The Way I Feel.m4a',
                           '12 Stones/12 Stones/04 Open Your Eyes.m4a',
                           '12 Stones/12 Stones/05 Home.m4a']
  end
end
