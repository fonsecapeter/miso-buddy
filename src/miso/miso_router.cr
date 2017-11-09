require "./mvc/router"

class MisoRouter < Router
  def routes
    route Status, [
      "sup",
      "status",
      "are you",
      "you doing",
      "you feeling"
    ]
    route WolframAlpha, %w[?]
    route Update, %w[update]
    route Quit, %w[quit exit bye later peace]
  end
end
