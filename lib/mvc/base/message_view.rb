# frozen_string_literal: true

# Base Message View Class
class MessageView
  def initialize(prefs, input)
    @preferences = prefs
    @input = input
    @_messages = []
    collect_messages
  end

  def message
    @_messages.sample
  end

  private

  def collect_messages
    @_messages += interpolated_messages
  end

  def interpolated_messages
    messages.map do |msg|
      msg % {
        user_name: generate_user_name,
        explative: generate_explative,
        explativing: generate_explativing
      }
    end
  end

  def generate_user_name
    (%w[buddy homie friend bruh] + [@preferences.user_name]).sample
  end

  def generate_explative
    %w[fl*p h*ck f*dge].sample
  end

  def generate_explativing
    skipping = [true, false].sample
    return %w[fl*pping f*dging].sample unless skipping
    "\b"
  end
end
