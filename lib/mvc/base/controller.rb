# frozen_string_literal: true

# Base controller class
class Controller
  def initialize(input)
    @input = input
    @messages = []
    collect_messages
  end

  def message
    @messages.sample
  end

  def response_class
    self.class.name.split('Controller')[0] + 'Response'
  end

  private

  def collect_messages
    @messages += simple_messages
  end
end
