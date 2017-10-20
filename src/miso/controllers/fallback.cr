require "../mvc/controller"

# Default Controller Class
#
# Runs when no other controller is matched
class FallbackController < Controller
  use_message_view Fallback
end
