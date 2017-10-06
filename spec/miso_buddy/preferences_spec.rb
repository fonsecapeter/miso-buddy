# frozen_string_literal: true

require 'spec_helper'
require 'config/preferences'

RSpec.describe Preferences do

  let (:miso_color) { :green }
  let (:prompt_color) { :red }
  let (:prefs_dict) do {
    miso_color: miso_color,
    prompt_color: prompt_color,
    user_name: 'buddy'
  } end

  describe '#initialize' do
    it 'can accept a hash' do
      prefs = Preferences.new(prefs_dict)
      expect(prefs.preferences).to eq(prefs_dict)
    end

    it 'sets values to attributes' do
      prefs = Preferences.new(prefs_dict)
      expect(prefs.miso_color).to eq(miso_color)
      expect(prefs.prompt_color).to eq(prompt_color)
    end

    it 'doesnt set attributes that arent there' do
      prefs = Preferences.new
      expect {prefs.banana}.to raise_error(NoMethodError)
    end

    it 'merges values with defaults' do
      prefs = Preferences.new({
        miso_color: miso_color
      })
      expect(prefs.miso_color).to eq(miso_color)
      expect(prefs.prompt_color).to eq(Preferences.defaults[:prompt_color])
    end

    context 'with a yaml file in the right place' do
      it 'loads yaml' do
        expect(File).to receive(:exists?).with(Preferences.prefs_file).and_return(true)
        expect(YAML).to receive(:load_file).with(Preferences.prefs_file).and_return(prefs_dict)
        prefs = Preferences.new
        expect(prefs.preferences).to eq(prefs_dict)
      end

      it 'merges yaml with defaults' do
        new_pref = {miso_color: miso_color}
        expect(File).to receive(:exists?).with(Preferences.prefs_file).and_return(true)
        expect(YAML).to receive(:load_file).with(Preferences.prefs_file).and_return(new_pref)
        prefs = Preferences.new
        expect(prefs.preferences).to eq(Preferences.defaults.merge(new_pref))
      end
    end

    context 'when there is no hash or yaml file' do
      it 'sets defaults' do
        expect(File).to receive(:exists?).with(Preferences.prefs_file).and_return(false)
        prefs = Preferences.new
        expect(prefs.preferences).to eq(Preferences.defaults)
      end
    end
  end

  context 'hypothetically' do
    it 'can write defaults to yaml' do
      expect(File).to receive(:write).with(Preferences.prefs_file, Preferences.defaults_yaml)
      Preferences.write_yaml_defaults
    end
  end
end
