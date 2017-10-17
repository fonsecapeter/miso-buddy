require "./mvc/router"

class MisoRouter < Router
  def routes
    route Quit, %w[quit exit bye later peace]
  end
end
