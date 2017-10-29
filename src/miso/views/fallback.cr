require "../mvc/message_view"

# Messages for when there are no other words
class FallbackMessageView < MessageView
  def messages
    [
      "Whuh?",
      "How bow dat?",
      "No %{explativing} way?",
      "What the %{explative} are you saying, %{user_name}?",
      "No foolin?",
      "Baba Booey.",
      "You said it.",
      "Party on.",
      "Hold up, really?",
      "For real, though?",
      "Outa sight.",
      "Awesome.",
      "Get out, really?",
      "Fresh.",
      "That's a shame.",
      "How about that.",
      "Isn't that something.",
      "Yass.",
      "Yass %{user_name}.",
      "Dope.",
      "Tell me about it.",
      "#{@input} amirite?",
      "If I had a nicket for every time I heard that one...",
      "Dope.",
      "Noice.",
      "Gnarly, dude.",
      "Get outta town, really?",
      "Super.",
      "That about sums it up.",
      "You know, I never thought of it like that.",
      "Abso-%{explativing}-lutely.",
      "Preching to the quire, %{user_name}."
    ]
  end
end
