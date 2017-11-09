require "../../mvc/message_view"

class ErrorMessageView < MessageView
  def message
    msg = super
    if @context.has_key?("error_message")
      error_msg = @context["error_message"]
      return "#{msg}\n#{error_msg}"
    else
      return msg
    end
  end

  def messages
    oops = [
      "Whoops",
      "Oops",
    ].sample
    maybe = [
      "maybe",
      "could you",
      "is there any way you could"
    ].sample
    try_again = [
      "try something else",
      "try something else",
      "rephrase that",
      "try asking that in a different way"
    ].sample
    [
      "#{oops}, something goofed, #{maybe} #{try_again}?",
      "Something %{explatived} that one up, #{maybe} #{try_again}?",
      "%{Explative}, #{maybe} #{try_again}?"
    ]
  end
end
