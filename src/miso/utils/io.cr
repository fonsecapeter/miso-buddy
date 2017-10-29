def miso_gets(prompt, flipped_prompt) : String | Nil
  print prompt
  input = gets
  log(input, flipped_prompt)
  input
end

def miso_puts(text : String, miso_color : Symbol, indent : String = "  ")
  formatted_text = "#{indent}#{text}"
    .colorize(miso_color)
    .to_s
    .gsub('\n', "\n#{indent}")
  puts formatted_text
end

# flip prompt and re-print
private def log(input, flipped_prompt)
  print "\033[A"  # move cursor up
  print "\033[K"  # clear line
  puts "#{flipped_prompt}#{input}"
end
