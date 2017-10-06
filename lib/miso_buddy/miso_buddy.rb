# frozen_string_literal: true

require 'miso_buddy/version'
require 'config/preferences'
require 'miso_app'

def run
  preferences = Preferences.new
  miso = MisoApp.new(preferences)
  miso.run
end
