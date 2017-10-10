# frozen_string_literal: true

require 'mvc/base/message_view'

# Messages for when miso first starts
#
# First line.
class Greet1MessageView < MessageView

  def messages
    maybe_with_username(ways_to_say_hi)
  end

  def morning_messages
    maybe_with_username([
      'Good morning',
      'Top of the morning to ya'
    ])
  end

  def afternoon_messages
    maybe_with_username([
      'Good afternoon',
      'Afternoon'
    ])
  end

  def evening_messages
    maybe_with_username(['Good evening'])
  end

  def night_messages
    hello = ways_to_say_hi.sample.downcase
    maybe_with_username(["Zzzzzz, hmm oh #{hello}"])
  end

  private

  def maybe_with_username(msgs)
    final_msgs = []
    msgs.each do |msg|
      final_msgs << msg + ','
      final_msgs << msg + " %{user_name},"
    end
    final_msgs
  end

  def ways_to_say_hi
    [
      'Hello',
      'Hello there',
      'Hey',
      'Hey there',
      'Hi',
      'Hi there',
      'Sup',
      'Yo'
    ]
  end
end
