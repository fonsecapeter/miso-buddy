require "../mvc/message_view"
require "colorize"

class HelpMessageView < MessageView
  def messages
    table_of_contents = descriptions
    [
      "You can ask me for any of these",
      "Just say something containing one of these",
      "Here's a list of stuff I can help with",
      "All you need to do is ask for something in this list"
    ].map { |msg| "#{msg}:#{table_of_contents}" }
  end

  private def descriptions
    formatted_descriptions = ""
    @hash_context["descriptions"].each do |name, explanation|
      formatted_name = name
        .colorize(@prefs.colors["prompt_color"])
        .to_s
        .ljust(25, '.')  # => escape sequence at least 9 chars
      formatted_explanation = explanation.colorize(@prefs.colors["miso_color"])
      formatted_descriptions += "\n  #{formatted_name}#{formatted_explanation}"
    end
    formatted_descriptions
  end
end
