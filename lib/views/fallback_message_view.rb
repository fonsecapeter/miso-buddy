# frozen_string_literal: true

require 'mvc/base/message_view'

# Messages for when there are no other words
class FallbackMessageView < MessageView
  def messages
    [
      'whuh',
      'how bow dat',
      "no %{explativing} way",
      "what the %{explative} are you saying, %{user_name}"
    ]
  end
end
