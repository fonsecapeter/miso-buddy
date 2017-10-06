# frozen_string_literal: true

require 'spec_helper'
require 'miso_app'
require 'config/preferences'
require 'miso_buddy/version'

RSpec.describe NoteBook do
  let(:prefs) { Preferences.new(Preferences.defaults) }
  subject(:miso) { MisoApp.new(prefs) }

  describe '#initialize' do
    it 'takes in preferences' do
      expect(miso.preferences).to eq(prefs)
    end
  end

  describe '#version' do
    it 'has a version number' do
      expect(notes.version).to eq(MisoBuddy::VERSION)
    end
  end
end
