# frozen_string_literal: true

require 'mvc/base/message_view'

# Messages for when there are no other words
class FallbackMessageView < MessageView
  def simple_messages
    ['whuh', 'how bow dat', 'no fl*pping way']
  end
end
