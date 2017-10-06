# frozen_string_literal: true

# Base Route Class for Input Matching
class Route
  attr_reader :controller, :matchers
  def initialize(name, matchers)
    @name = name
    @matchers = matchers
  end

  def controller_name
    (@name.to_s + 'Controller').to_sym
  end

  def to_s
    "<#{@name}Route>"
  end
end
