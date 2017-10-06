# frozen_string_literal: true

require 'yaml'

# User Preferences
#
# Optional settings that affect the app.
class Preferences
  attr_reader :preferences

  @@defaults = {
    miso_color: :light_red,
    prompt_color: :light_yellow,
    user_name: 'buddy'
  }
  @@prefs_file = File.expand_path('~/.miso-buddy.yml')

  def self.defaults
    @@defaults
  end

  def self.prefs_file
    @@prefs_file
  end

  def self.defaults_yaml
    @@defaults.to_yaml
  end

  def initialize(prefs=nil)
    @preferences = load_preferences(prefs)
  end

  # Write defaults to a yaml file
  def self.write_yaml_defaults
    File.write(@@prefs_file, self.defaults_yaml)
  end

  def method_missing(attribute)
    return @preferences[attribute] if @preferences.has_key?(attribute)
    super
  end

  def to_s
    @preferences.to_s
  end

  private

  def load_yaml_preferences
    prefs = YAML::load_file(@@prefs_file)
    return(
      prefs.inject({}) do |processed, (key, val)|
        processed[key.to_sym] = val
        processed
      end
    )
  end

  def load_preferences(prefs)
    if prefs.nil?
      if File.exists?(@@prefs_file)
        prefs = load_yaml_preferences
      else
        prefs = @@defaults
      end
    end
    prefs = prefs.each do |key, val|
      prefs[key] = val.to_sym if should_be_sym?(key)
    end
    merged_prefs = @@defaults.merge(prefs)
    return merged_prefs
  end

  def should_be_sym?(key)
    %w[miso_color prompt_color].include?(key)
  end
end
