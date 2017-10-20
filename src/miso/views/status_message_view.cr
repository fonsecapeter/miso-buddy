require "../mvc/message_view"

class StatusMessageView < MessageView
  def messages
    [
      "Can't complain.",
      "I'm doin' just fine.",
      "Splendid, thanks for asking.",
      "Having a ball.",
      "Living the dream.",
      "Straight chillin'.",
      "Oh you know, just hangin' out.",
      "Feeling awesome."
    ]
  end

  def morning_messages
    ["Still waking up..."]
  end

  def night_messages
    ["Zzz..."]
  end
end
