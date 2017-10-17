require "yaml"
require "./constants"

class Preferences
  @preferences : Hash(String, String)
  @colors : Hash(String, Symbol)
  @@defaults = DEFAULT_PREFS
  @@prefs_file = File.expand_path(PREFS_FILE)

  getter :colors

  def initialize()
    @preferences = load_preferences
    @colors = extract_colors
  end

  def [](key : String) : String
    @preferences[key]
  end

  def colors
    @colors
  end

  def to_s
    @preferences.to_s
  end

  private def load_preferences
    if File.exists?(@@prefs_file)
      prefs = {} of String => String
      prefs_yml = load_yaml_preferences
      prefs_yml.each do |key, val|
        prefs[key.to_s] = val.to_s
      end
    else
      prefs = @@defaults
    end
    merged = @@defaults.merge(prefs)
  end

  private def load_yaml_preferences
    YAML.parse(File.open(@@prefs_file, "r"))
  end

  private def extract_colors
    colors = {} of String => Symbol
    @preferences.each do |key, val|
      colors[key] = COLORS[val] if COLOR_PREFS.includes?(key)
    end
    colors
  end
end
