# frozen_string_literal: true

require 'mvc/base/message_view'

# Messages for when miso first starts
#
# Second line.
class Greet2MessageView < MessageView

  def messages
    [
      'Can I help you with something?',
      'How are you doing?',
      'How are you?',
      "How the %{explative} are you?",
      'How can I help ya?',
      'How\'s life?',
      'Need a hand?',
      'Need something?',
      'Sup?',
      'What can I do for you?',
      'What can I do ya for?',
      'What can I help you with?',
      'What\'s that, trouble at the old mill?',
      'You lit the miso-signal?',
      'You rang my bell?',
      'You rang?'
    ]
  end

  def morning_messages
    ['Computing this early?']
  end

  def afternoon_messages
    ['What can I help you with on this fine afternoon?']
  end

  def evening_messages
    ['What can I help you with this evening?']
  end

  def night_messages
    ['Still computing?']
  end
end
