require "../../mvc/message_view"

class UnexpectedJSONMessageView < MessageView
  def messages
    [
      "I'm afraid I don't know that one.",
      "No clue on that one.",
      "Beats the %{explative} out of me.",
      "I don't know.",
      "I don't %{explativing} know.",
      "How the %{explative} should I know?"
    ]
  end
end
