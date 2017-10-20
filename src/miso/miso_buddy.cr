require "colorize"
require "./miso_router"
require "./config/preferences"
require "./controllers/greet_controller"

# Main App loop with i/o
class MisoBuddy
  @prefs : Preferences
  @prompt : Colorize::Object(String)
  @flipped_prompt : Colorize::Object(String)

  def initialize
    @prefs = Preferences.new
    @router = MisoRouter.new(@prefs)
    @prompt = " > ".colorize(@prefs.colors["prompt_color"])
    @flipped_prompt = " < ".colorize(@prefs.colors["prompt_color"])
  end

  def run
    greet
    loop do
      input = miso_gets
      next if input.is_a?(Nil)
      controller = @router.find_route(input)
      process(controller)
    end
  end

  private def process(controller : Controller)
    miso_puts(controller.message) unless controller.message.is_a?(Nil)
    controller.action if controller.responds_to?(:action)
  end

  private def miso_gets
    print(@prompt)
    input = gets
    log(input)
    input
  end

  private def miso_puts(text)
    puts("  #{text}".colorize(@prefs.colors["miso_color"]))
  end

  # flip prompt and re-print
  private def log(input)
    print "\033[A"  # move cursor up
    print "\033[K"  # clear line
    puts("#{@flipped_prompt}#{input}")
  end

  private def greet
    process(Greet1Controller.new(@prefs, ""))
    process(Greet2Controller.new(@prefs, ""))
  end
end
