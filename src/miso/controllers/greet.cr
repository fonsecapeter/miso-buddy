require "../mvc/controller"

class Greet1Controller < Controller
  use_message_view Greet1

  def action
    sleep 0.5
  end
end

class Greet2Controller < Controller
  use_message_view Greet2
end
