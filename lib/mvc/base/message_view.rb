# frozen_string_literal: true

# Base Message View Class
class MessageView
  def initialize(input)
    @input = input
    @messages = []
    collect_messages
  end

  def message
    @messages.sample
  end

  private

  def collect_messages
    @messages += simple_messages
  end
end
