COLORS = {
 "black" => :black,
 "red" => :red,
 "green" => :green,
 "yellow" => :yellow,
 "blue" => :blue,
 "magenta" => :magenta,
 "cyan" => :cyan,
 "light_gray" => :light_gray,
 "dark_gray" => :dark_gray,
 "light_red" => :light_red,
 "light_green" => :light_green,
 "light_yellow" => :light_yellow,
 "light_blue" => :light_blue,
 "light_magenta" => :light_magenta,
 "light_cyan" => :light_cyan,
 "white" => :white
}

COLOR_PREFS = ["miso_color", "prompt_color"]

DEFAULT_PREFS = {
  "miso_color" => "white",
  "prompt_color" => "light_red",
  "user_name" => "buddy"
} of String => String

PREFS_FILE = "~/.miso-buddy.yml"
