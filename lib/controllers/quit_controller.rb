# frozen_string_literal: true

require 'mvc/base/controller'

# Weird Controller class
class QuitController < Controller
  def simple_messages
    ['later', 'have a good one', 'by dude']
  end

  def action
    exit 0
  end
end
