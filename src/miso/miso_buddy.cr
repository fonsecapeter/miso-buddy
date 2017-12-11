require "colorize"
require "./miso_router"
require "./config/preferences"
require "./controllers/greet"
require "./utils/io"

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
    print "\033[?1049h" # open alt screen buf
    print "\033[0;0H"  # move to 0:0
    greet
    loop do
      input = miso_gets(@prompt, @flipped_prompt)
      next if input.is_a?(Nil)
      controller = @router.find_route(input.downcase)
      controller.process
    end
  end

  private def greet
    Greet1Controller.new(@prefs, "").process
    Greet2Controller.new(@prefs, "").process
  end
end
