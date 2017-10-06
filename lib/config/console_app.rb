# frozen_string_literal: true

require 'optparse'
require 'config/preferences'

# Argument-Processing Mixin for CLI Tools
module ConsoleApp
  # Entry method to parse args
  #
  # Reads cli arguments and chooses an instance method to run on the class.
  #
  # Notes:
  #  on_run will be executed if no --options match
  def run
    options = OptionParser.new do |opts|
      opts.banner = 'Usage: miso'
      opts.separator('')
      opts.separator('Options:')
      opts.separator('')
      opts.on('-h', '--help', 'Show this message') do
        puts(opts)
        exit(0)
      end
      opts.on('-v', '--version', 'Show version') do
        puts(version)
        exit(0)
      end
      opts.separator('')
      opts.separator(
        "Preferences are loaded from #{Preferences.prefs_file} and should"\
        'look like:'
      )
      opts.separator(Preferences.defaults_yaml)
      opts.separator('')
      opts.separator(
        'Documentation at '\
        'https://github.com/fonsecapeter/miso-buddy or man miso-buddy'
      )
    end
    begin
      options.parse!
    rescue OptionParser::InvalidOption
      puts(options)
      exit(1)
    end
    on_run
  end
end
