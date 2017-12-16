require 'mpd/commands/abstract'

module MPD
  module Commands
    #
    # Uses "listall" command to get
    # all files (directories are filtered out) from db.
    #
    class AllFiles < Abstract
      def execute
        super('listall').key_value_pairs
                        .select { |e| e[0] == 'file' }
                        .map(&:last)
      end
    end
  end
end
