# frozen_string_literal: true

require 'mvc/utils/dynamic_loaders'

# Load all controllers
module Controllers
  require_files('controllers', '*_controller')
end
