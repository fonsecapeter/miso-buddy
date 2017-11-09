require "../../mvc/message_view"

class UpdateSuccessMessageView < MessageView
  def messages
    woo = [
      "I'm all up to date!",
      "I'm feeling fresh!",
      "Now that's better!",
      "Coolbeans!"
    ].sample
    restart = [
      "Give me a restart to start using the latest version.",
      "Just give me a reboot when you're ready to use the new me."
    ].sample
    ["#{woo}\n#{restart}"]
  end
end
