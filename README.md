# Ruby MPD client

[![Gem Version](https://badge.fury.io/rb/ruby-mpd-client.svg)](https://badge.fury.io/rb/ruby-mpd-client)
<br />
[![Build Status](https://travis-ci.org/Nondv/ruby-mpd-client.svg?branch=master)](https://travis-ci.org/Nondv/ruby-mpd-client) **master**
<br />
[![Build Status](https://travis-ci.org/Nondv/ruby-mpd-client.svg?branch=develop)](https://travis-ci.org/Nondv/ruby-mpd-client) **develop**

Yet another ruby mpd client.

It does not really provide you some object model for interacting with MPD.
Mostly it's just collection of MPD commands with different names.

There's `MPD::Connection` wrapper over `Socket`, `MPD::ServerResponse` - string
with some useful methods, `MPD::Playlist` - verypoor abstraction over song list
and `MPD::Commands` module that contains all implemented commands.

See on [rubydoc](http://www.rubydoc.info/gems/ruby-mpd-client).

## Installation

```ruby
gem 'ruby-mpd-client'
```

## Usage

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

For available commands see `MPD::Comands` subclasses on
[rubydoc.info](http://www.rubydoc.info/github/Nondv/ruby-mpd-client/MPD/Commands).

## Contributing

I guess your contribution would be a some command implementation or some models
better than `MPD::Playlist` and `MPD::Song`. Feel free to create pull requests,
issues or contact me.

[Link to github repo](https://github.com/Nondv/ruby-mpd-client)

## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).

