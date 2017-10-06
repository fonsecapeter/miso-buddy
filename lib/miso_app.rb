# frozen_string_literal: true

require 'colorize'
require 'readline'
require 'config/console_app'
require 'miso_buddy/version'
require 'miso_router'

# Main App loop with i/o
class MisoApp
  include ConsoleApp
  attr_reader :preferences

  def initialize(prefs)
    @preferences = prefs
    @prompt = ' > '.colorize(prefs.prompt_color)
    @flipped_prompt = ' < '.colorize(prefs.prompt_color)
    @router = MisoRouter.new
  end

  def on_run
    loop do
      input = miso_gets
      controller = @router.find_route(input)
      miso_puts(controller.message) unless controller.message.nil?
      controller.action if controller.respond_to?(:action)
    end
  end

  def version
    MisoBuddy::VERSION
  end

  private

  def miso_gets
    input = Readline.readline(@prompt)
    log(input)
    input
  end

  def miso_puts(text)
    puts("  #{text}".colorize(@preferences.miso_color))
  end

  # flip prompt and re-print
  def log(input)
    $stdout.flush
    print "\033[A"  # move cursor up
    print "\033[K"  # clear line
    $stdout.flush
    puts("#{@flipped_prompt}#{input}")
  end
end
