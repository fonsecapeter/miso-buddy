require "../mvc/controller"

# Give Miso a break
class QuitController < Controller
  use_message_view Quit

  def action
    print "\033[?1049l"  # close alt screen buf
    exit 0
  end
end
