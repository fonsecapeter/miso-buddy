# Base Message View Class
abstract class MessageView
  @context : Hash(String, String)
  @hash_context = {} of String => Hash(String, String)
  def initialize(
    @prefs : Preferences,
    @input : String,
    @context = {} of String => String,
    @hash_context = {} of String => Hash(String, String)
  )
    @_messages = [] of String
    collect_messages
  end

  def message
    @_messages.sample
  end

  def messages
    [] of String
  end

  def morning_messages
    [] of String
  end

  def afternoon_messages
    [] of String
  end

  def evening_messages
    [] of String
  end

  def night_messages
    [] of String
  end

  private def collect_messages
    @_messages += interpolated(messages)
    @_messages += interpolated(time_based_messages)
  end

  private def interpolated(msgs)
    msgs.map do |msg|
      msg % {
        user_name: generate_user_name,
        explative: generate_explative,
        Explative: generate_explative.capitalize,
        explativing: generate_explativing,
        explatived: generate_explatived
      }
    end
  end

  private def generate_user_name
    (%w[
      buddy homie friend bruh amigo queen kimosabe squire
    ] << @prefs["user_name"]).sample
  end

  private def generate_explative
    %w[fl*p h*ck f*dge].sample
  end

  private def generate_explativing
    skipping = [true, false].sample
    return %w[fl*pping f*dging].sample unless skipping
    '\b'
  end

  private def generate_explatived
    %w[fl*pped f*dged b*rked].sample
  end

  private def time_based_messages
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
