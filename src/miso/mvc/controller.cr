require "./message_view"
require "../views/**"

macro use_message_view(name)
  def view_class
    {{name}}MessageView
  end
end

# Base controller class
abstract class Controller
  def initialize(@prefs : Preferences, @input : String)
  end

  def message
    message_view.message
  end

  private def message_view : MessageView
    view_class.new(@prefs, @input)
  end
end
