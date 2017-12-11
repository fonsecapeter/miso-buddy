require "../controllers/**"
require "./route"

macro route(name, matchers, description)
  add_route({{name}}Controller, {{matchers}}, {{description}})
end

# Route input based in dynamic matchers
abstract class Router
  getter :_routes
  def initialize(@prefs : Preferences)
    @_routes = [] of Route
    add_route(FallbackController, [] of String, "For when nothing else matches.")
    routes
  end

  # Add custom routes here
  def routes
    raise "Your router: #{self} has no routes! Add some in #routes"
  end

  # Add new route
  def add_route(
      controller_class : Controller.class,
      matchers : Array(String),
      description : String
    )
    @_routes << Route.new(controller_class, matchers, description)
  end

  # Get correct route
  #
  # Returns:
  #   - instantiated controller
  def find_route(input : String)
    controller_class = match(input)
    controller_class.new(@prefs, input)
  end

  # Get name of controller class
  private def match(input : String)
    @_routes.each do |candidate_route|
      return candidate_route.controller_class if input_matches_matchers?(
        input,
        candidate_route.matchers
      )
    end
    FallbackController
  end

  private def input_matches_matchers?(input : String, matchers : Array(String))
    matchers.any? do |matcher|
      input.includes?(matcher)
    end
  end

  private def fallback_route
    @_routes.select do |candidate_route|
      candidate_route.name == Fallback
    end
  end
end
