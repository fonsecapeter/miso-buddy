# frozen_string_literal: true

require 'mvc/base/message_view'

# Farewell Messages
class QuitMessageView < MessageView
  def messages
    [
      'later',
      "have a %{explativing} good one",
      'by dude'
    ]
  end
end
