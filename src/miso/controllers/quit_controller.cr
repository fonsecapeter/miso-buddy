require "../mvc/controller"

# Give Miso a break
class QuitController < Controller
  use_message_view Quit

  def action
    exit 0
  end
end
