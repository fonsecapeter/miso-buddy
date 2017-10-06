# frozen_string_literal: true

require 'mvc/message_views'

# Base controller class
class Controller
  def initialize(prefs, input)
    @preferences = prefs
    @input = input
  end

  def message
    find_message_view.message
  end

  private

  def find_message_view
    MessageViews.const_get(message_view_name).new(@preferences, @input)
  end

  def message_view_name
    self.class.name.split('Controller')[0] + 'MessageView'
  end
end
