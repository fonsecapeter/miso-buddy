require "../mvc/controller"

# Gives Miso a Break
class QuitController < Controller
  use_message_view Quit

  def action
    exit 0
  end
end
