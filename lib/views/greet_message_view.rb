# frozen_string_literal: true

require 'mvc/base/message_view'

# Messages for when miso first starts
#
# First line.
class Greet1MessageView < MessageView
  def messages
    [
      'Hi %{user_name},',
      'Hey %{user_name},'
    ]
  end
end

# Messages for when miso first starts
#
# First line.
class Greet2MessageView < MessageView
  def messages
    [
      'How are ya',
      'What can I do ya for',
      "How the %{explative} are you doing"
    ]
  end
end
