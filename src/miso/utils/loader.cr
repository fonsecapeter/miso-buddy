class Loader
  MOVE_UP = "\033[F"
  EMPTY_FRAME = "        "
  INTERVAL = 0.1
  SINGLE = "=".colorize(:light_red)
  DOUBLE = "==".colorize(:light_red)
  TRIPLE = "===".colorize(:light_red)
  LEFT = "[".colorize.mode(:bold)
  RIGHT = "]".colorize.mode(:bold)

  FRAMES = {
    "  #{LEFT}    #{RIGHT}",
    "  #{LEFT}#{SINGLE}   #{RIGHT}",
    "  #{LEFT}#{DOUBLE}  #{RIGHT}",
    "  #{LEFT}#{TRIPLE} #{RIGHT}",
    "  #{LEFT} #{TRIPLE}#{RIGHT}",
    "  #{LEFT}  #{DOUBLE}#{RIGHT}",
    "  #{LEFT}   #{SINGLE}#{RIGHT}",
    "  #{LEFT}  #{DOUBLE}#{RIGHT}",
    "  #{LEFT} #{TRIPLE}#{RIGHT}",
    "  #{LEFT}#{TRIPLE} #{RIGHT}",
    "  #{LEFT}#{DOUBLE}  #{RIGHT}",
    "  #{LEFT}#{SINGLE}   #{RIGHT}",
  }

  def initialize
    @idx = 0
  end

  def whirl
    print FRAMES[@idx]
    sleep INTERVAL
    puts MOVE_UP
    increment
  end

  def clear
    puts "#{MOVE_UP}\n#{EMPTY_FRAME}#{MOVE_UP}"
  end

  private def increment
    @idx += 1
    @idx = 0 unless @idx < FRAMES.size - 1
  end
end
