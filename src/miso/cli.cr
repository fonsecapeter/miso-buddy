require "option_parser"
require "yaml"
require "../miso"
require "./miso_buddy"
require "./config/constants"

OptionParser.parse! do |parser|
  parser.banner = "Usage: miso [options]"

  parser.on("-v", "--version", "Show version") do
    puts Miso::VERSION
    exit 0
  end

  parser.on("-h", "--help", "Show this help") do
    puts parser
    puts
    puts "Preferences are loaded from #{PREFS_FILE} and should look like:"
    puts DEFAULT_PREFS.to_yaml
    puts
    puts "Author: #{Miso::AUTHOR}"
    puts "Homepage: #{Miso::HOMEPAGE}"
    exit 0
  end
end

MisoBuddy.new.run
