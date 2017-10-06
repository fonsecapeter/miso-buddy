# frozen_string_literal: true

require 'mvc/controllers'
require 'mvc/base/route'

# Route input based in dynamic matchers
class Router
  FALLBACK = :Fallback

  def initialize
    @_routes = []
    route FALLBACK, []
    routes
  end

  # Add custom routes here
  def routes
    raise NoRoutesError.new(self)
  end

  # Add new route
  #
  # Args:
  #   - controller (str/sym): The name of the controller
  #   - matchers (array of strs): The strings to match against @input
  def route(controller, matchers)
    @_routes << Route.new(controller, matchers)
  end

  # Get correct route
  #
  # Returns:
  #   - instantiated controller
  def find_route(input)
    controller_name = match(input)
    Controllers.const_get(controller_name).new(input)
  end

  private

  # Get name of controller class
  def match(input)
    @_routes.each do |candidate_route|
      return candidate_route.controller_name if input_matches_matchers?(
        input,
        candidate_route.matchers
      )
    end
    :FallbackController
  end

  def input_matches_matchers?(input, matchers)
    matchers.any? do |matcher|
      input.include?(matcher)
    end
  end

  def fallback_route
    @_routes.select do |candidate_route|
      candidate_route.name == FALLBACK
    end
  end
end

# Custom error for no routes
class NoRoutesError < StandardError
  def initialize(router)
    @router = router
  end

  def message
    "Your router: #{@router} has no routes! Add some with in #routes"
  end
end
