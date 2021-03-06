require_relative 'server_commands'

# This dummy immitates some responses without socket
class ServerDummy
  def playlistinfo(arg)
    ServerCommands::Playlistinfo.new(arg, CURRENT_PLAYLIST).execute
  end

  def listall
    ServerCommands::Listall.new.execute
  end

  def listplaylists
    ServerCommands::Listplaylists.new.execute
  end

  CURRENT_PLAYLIST = [{ 'file' => '12 Stones/12 Stones/01 Crash.m4a',
                        'Last-Modified' => '2017-07-02T13:44:51Z',
                        'Artist' => '12 Stones',
                        'Album' => '12 Stones',
                        'Title' => 'Crash',
                        'Track' => '1/12',
                        'Genre' => 'Альтернативная музыка',
                        'Date' => '2002-04-23T07:00:00Z',
                        'Composer' => 'Paul McCoy, Kevin Dorr, Eric Weaver & Patrick Quave',
                        'Disc' => '1/1',
                        'AlbumArtist' => '12 Stones',
                        'Time' => '222',
                        'Pos' => '0',
                        'Id' => '1' },
                      { 'file' => '12 Stones/12 Stones/02 Broken.m4a',
                        'Last-Modified' => '2017-07-02T13:43:03Z',
                        'Artist' => '12 Stones',
                        'Album' => '12 Stones',
                        'Title' => 'Broken',
                        'Track' => '2/12',
                        'Genre' => 'Альтернативная музыка',
                        'Date' => '2002-04-23T07:00:00Z',
                        'Composer' => 'Paul McCoy, Kevin Dorr, Eric Weaver & Patrick Quave',
                        'Disc' => '1/1',
                        'AlbumArtist' => '12 Stones',
                        'Time' => '179',
                        'Pos' => '1',
                        'Id' => '2' },
                      { 'file' => '12 Stones/12 Stones/03 The Way I Feel.m4a',
                        'Last-Modified' => '2017-07-02T13:59:37Z',
                        'Artist' => '12 Stones',
                        'Album' => '12 Stones',
                        'Title' => 'The Way I Feel',
                        'Track' => '3/12',
                        'Genre' => 'Альтернативная музыка',
                        'Date' => '2002-04-23T07:00:00Z',
                        'Composer' => 'Eric Weaver, Kevin Dorr, Patrick Quave & Paul McCoy',
                        'Disc' => '1/1',
                        'AlbumArtist' => '12 Stones',
                        'Time' => '227',
                        'Pos' => '2',
                        'Id' => '3' },
                      { 'file' => '12 Stones/12 Stones/04 Open Your Eyes.m4a',
                        'Last-Modified' => '2017-07-02T13:57:00Z',
                        'Artist' => '12 Stones',
                        'Album' => '12 Stones',
                        'Title' => 'Open Your Eyes',
                        'Track' => '4/12',
                        'Genre' => 'Альтернативная музыка',
                        'Date' => '2002-04-23T07:00:00Z',
                        'Composer' => 'Paul McCoy, Kevin Dorr, Eric Weaver & Patrick Quave',
                        'Disc' => '1/1',
                        'AlbumArtist' => '12 Stones',
                        'Time' => '192',
                        'Pos' => '3',
                        'Id' => '4' },
                      { 'file' => '12 Stones/12 Stones/05 Home.m4a',
                        'Last-Modified' => '2017-07-02T13:48:53Z',
                        'Artist' => '12 Stones',
                        'Album' => '12 Stones',
                        'Title' => 'Home',
                        'Track' => '5/12',
                        'Genre' => 'Альтернативная музыка',
                        'Date' => '2002-04-23T07:00:00Z',
                        'Composer' => 'Paul McCoy, Kevin Dorr, Eric Weaver & Patrick Quave',
                        'Disc' => '1/1',
                        'AlbumArtist' => '12 Stones',
                        'Time' => '205',
                        'Pos' => '4',
                        'Id' => '5' }]
                     .freeze
end
