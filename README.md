# Ruby MPD client

Yet another ruby mpd client.

This gem is for my own usage (practicing my programming skills). But
I would be glad to know if you found it useful.

## Installation

```ruby
gem 'ruby-mpd-client'
```

## Usage

It does not do much

```ruby
require 'ruby-mpd-client'

mpd = MPD::Client.new(host: 'localhost')
mpd.volume(50)
mpd.random(true)
mpd.next
# and so on
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Nondv/ruby-mpd-client.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

