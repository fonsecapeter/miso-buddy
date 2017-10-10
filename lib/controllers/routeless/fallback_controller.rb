# frozen_string_literal: true

require 'mvc/base/controller'

# Default Controller Class
#
# Runs when no other controller is matched
FallbackController = Class.new(Controller)
