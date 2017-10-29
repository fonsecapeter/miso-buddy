require "../mvc/controller"
require "../models/wolfram_alpha_client"
require "../views/http/*"
require "../utils/io"

# Ask Miso just about anything!
class WolframAlphaController < Controller
  def action
    wolf = WolframAlphaClient.new
    begin
      answer = wolf.ask_wolfram(@input, @prefs)
    rescue NoInternetException
      return render NoInternetMessageView
    rescue ex : BadStatusCodeException
      status_code = ex.message
      raise(
        "BadStatusCodeException raised without message"
      ) if status_code.is_a?(Nil)
      return render BadStatusCodeMessageView, context = {
        "status_code" => status_code
      }
    rescue UnexpectedJSONException
      return render UnexpectedJSONMessageView
    end
    miso_puts(answer, @prefs.colors["miso_color"], indent = "")
  end
end
