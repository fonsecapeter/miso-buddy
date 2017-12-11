require "./controller"

# Base Route Class for Input Matching
class Route
  @primary_match : String?
  getter :controller_class
  getter :controller
  getter :matchers
  getter :description
  getter :primary_match
  def initialize(
      @controller_class : Controller.class,
      @matchers : Array(String),
      @description : String
    )
    if @matchers.empty?
      @primary_match = nil
    else
      @primary_match = @matchers.first
    end
  end

  def to_s
    "<#{@name}Route>"
  end
end
