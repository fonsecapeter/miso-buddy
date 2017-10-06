# frozen_string_literal: true

require 'mvc/base/message_view'

# Farewell Messages
class QuitMessageView < MessageView
  def simple_messages
    ['later', 'have a good one', 'by dude']
  end
end
