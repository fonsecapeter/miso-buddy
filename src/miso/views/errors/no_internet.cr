require "../../mvc/message_view"

class NoInternetMessageView < MessageView
  def messages
    wifi = %w[wifi internet interwebs].sample
    [
      "I know you did not just ask me to do that without #{wifi}.",
      "I'm gonna need some #{wifi} for that one.",
      "It looks like I'm coming down with a case of network connectivity defficiency.",
      "Hook me up with some %{explativing} #{wifi}, %{user_name}!",
      "I'll need #{wifi} to help you with that.",
      "Are we in the middle of the ocean? I need some %{explativing} #{wifi}!",
      "How the %{explative} and I supposed to do that without any %{explativing} #{wifi}?",
      "Connect to some %{explativing} #{wifi} first."
    ]
  end
end
