require "../mvc/message_view"

# Farewell Messages
class QuitMessageView < MessageView
  def messages
    [
      "Later!",
      "Have a %{explativing} good one.",
      "Have a good one.",
      "By dude.",
      "See ya!",
      "Until next time.",
      "Adios.",
      "Farewell for now.",
      "Good day, squire.",
      "Catch you later.",
      "Peace!"
    ]
  end

  def morning_messages
    ["Have a good morning!"]
  end

  def night_messages
    ["Good night."]
  end

end
