# frozen_string_literal: true

require 'mvc/base/controller'

# Default Controller Class
#
# Runs when no other controller is matched
class FallbackController < Controller
  def simple_messages
    ['whuh', 'how bow dat', 'no fl*pping way']
  end
end
