require "./message_view"
require "../views/**"
require "../utils/io"

macro use_message_view(name)
  private def view_class
    {{name}}MessageView
  end
end

# Base controller class
abstract class Controller
  def initialize(@prefs : Preferences, @input : String)
  end

  def action
    # implement in subclass or no-op
  end

  def render(
    view_cls : MessageView.class | Nil = nil,
    context = {} of String => String
  ) : String | Nil
    view_cls ||= view_class
    return if view_cls.is_a?(Nil)
    view = view_cls.new(@prefs, @input, context)
    msg = view.message
    return if msg.is_a?(Nil)
    miso_puts(msg, @prefs.colors["miso_color"])
  end

  def process
    msg = message
    miso_puts(msg, @prefs.colors["miso_color"]) unless msg.is_a?(Nil)
    action
  end

  private def view_class
    nil
  end

  private def message : String | Nil
    render
  end
end
