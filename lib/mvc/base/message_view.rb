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

  def messages
    []
  end

  def morning_messages
    []
  end

  def afternoon_messages
    []
  end

  def evening_messages
    []
  end

  def night_messages
    []
  end

  private

  def collect_messages
    @_messages += interpolated(messages)
    @_messages += interpolated(time_based_messages)
  end

  def interpolated(msgs)
    msgs.map do |msg|
      msg % {
        user_name: generate_user_name,
        explative: generate_explative,
        explativing: generate_explativing
      }
    end
  end

  def generate_user_name
    (%w[buddy homie friend bruh] << @preferences.user_name).sample
  end

  def generate_explative
    %w[fl*p h*ck f*dge].sample
  end

  def generate_explativing
    skipping = [true, false].sample
    return %w[fl*pping f*dging].sample unless skipping
    "\b"
  end

  def time_based_messages
    case Time.now.hour
    when 5...12
      morning_messages
    when 12...16
      afternoon_messages
    when 16...20
      evening_messages
    else
      night_messages
    end
  end
end
