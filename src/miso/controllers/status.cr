require "../mvc/controller"

# Ask Miso how he's doing
class StatusController < Controller
  use_message_view Status
end
