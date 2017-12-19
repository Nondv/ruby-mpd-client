# Ruby MPD client

**master** [![Build Status](https://travis-ci.org/Nondv/ruby-mpd-client.svg?branch=master)](https://travis-ci.org/Nondv/ruby-mpd-client)
<br />
**develop** [![Build Status](https://travis-ci.org/Nondv/ruby-mpd-client.svg?branch=develop)](https://travis-ci.org/Nondv/ruby-mpd-client)

Yet another ruby mpd client.

This gem is for my own usage (practicing my programming skills). But
I would be glad to know if you found it useful.

See on [rubydoc](http://www.rubydoc.info/gems/ruby-mpd-client)

## Installation

```ruby
gem 'ruby-mpd-client'
```

## Usage

It does not do much

```ruby
require 'ruby-mpd-client'

MPD::Commands::SetVolume.new(host: 'localhost') # :host can be ommited
                        .execute(75)
MPD::Commands::Next.new.execute

#
# to use one connection
#
conn = MPD::Connection.new(host: 'localhost', port: 6600)
conn.connect
conn.gets # first MPD response is always "OK <version>\n"
MPD::Commands::Next.new(connection: conn).execute
MPD::Commands::Pause.new(connection: conn).execute
```

For available commands see [lib/mpd/commands](lib/mpd/commands).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nondv/ruby-mpd-client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

