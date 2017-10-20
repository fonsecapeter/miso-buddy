require "./mvc/router"

class MisoRouter < Router
  def routes
    route Quit, %w[quit exit bye later peace]
    route Status, [
      "sup",
      "status",
      "are you",
      "you doing",
      "you feeling"
    ]
  end
end
