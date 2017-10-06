# frozen_string_literal: true

require 'spec_helper'
require 'miso_buddy/version'

RSpec.describe MisoBuddy do
  it 'has a version number' do
    expect(MisoBuddy::VERSION).not_to be nil
  end
end
