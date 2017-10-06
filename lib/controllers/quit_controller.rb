# frozen_string_literal: true

require 'mvc/base/controller'

# Gives Miso a Break
class QuitController < Controller
  def action
    exit 0
  end
end
