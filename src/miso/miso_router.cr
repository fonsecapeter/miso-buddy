require "./mvc/router"

class MisoRouter < Router
  def routes
    route(
      Status,
      [
        "sup",
        "status",
        "are you",
        "you doing",
        "you feeling"
      ],
      "Ask me how I'm doing."
    )
    route(
      WolframAlpha,
      %w[?],
      "Ask me something the internet might know."
    )
    route(
      Update,
      %w[update],
      "Get the latest and greatest version of me."
    )
    route(
      Quit,
      %w[quit exit bye later peace],
      "Give me a break."
    )
    route(
      Help,
      %w[help halp],
      "Show this help message."
    )
  end
end
