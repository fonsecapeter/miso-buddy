require "./controller"

# Base Route Class for Input Matching
class Route
  getter :controller_class, :controller, :matchers
  def initialize(@controller_class : Controller.class, @matchers : Array(String))
  end

  def to_s
    "<#{@name}Route>"
  end
end
