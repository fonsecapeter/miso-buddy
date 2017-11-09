require "../../mvc/message_view"
require "./error"

class BadStatusCodeMessageView < ErrorMessageView
  def message
    msg = super
    if @context.has_key?("status_code")
      code = @context["status_code"]
      return "(#{code}) #{msg}"
    else
      return msg
    end
  end
end
