require "../../mvc/message_view"

class UpdateStartMessageView < MessageView
  def messages
    [
      "Updating myself with git...",
      "Checking GitHub...",
      "Hold on to your butts..."
    ]
  end
end
