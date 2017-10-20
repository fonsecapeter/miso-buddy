require "../../mvc/message_view"

class BadStatusCodeMessageView < MessageView
  def message
    msg = super
    status_code = @context["status_code"]
    "(#{status_code}) #{msg}"
  end

  def messages
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
      "Whoops someone goofed, #{maybe} #{try_again}?",
      "Someone %{explatived} that one up, #{maybe} #{try_again}?",
      "%{explative}".capitalize + ", #{maybe} #{try_again}?"
    ]
  end
end
