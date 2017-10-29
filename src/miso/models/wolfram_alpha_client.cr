require "json"
require "../utils/http_fibers"
require "../utils/loader"

class WolframAlphaClient
  WOLFRAM_URL = "https://api.wolframalpha.com/v2/query"
  INDENT = "  "

  # Asks wolfram alpha
  #
  # Returns:
  #   - answer : String if found
  #   - Nil if not
  def ask_wolfram(input, @prefs : Preferences) : String
    app_id = prefs["wolfram_app_id"]
    loader = Loader.new
    params = {
      "input" => [input],
      "appid" => [app_id],
      "output" => ["JSON"],
      "format" => ["plaintext"],
      "includepodid" => [
        "Result",
        "Definition:WordData",
        "BasicInformation:PeopleData",
        "NotableFacts:PeopleData",
        "Biography:FictionalCharacterData",
        "NotableWorks:FictionalCharacterData",
        "OrdinalRankings",
        "Carbohydrates:ExpandedFoodData",
        "CreatorOneInitialRow:FictionalCharacterData",
        "InferredNearestCityCenter:InternetData",
        "HostInformationPodIP:InternetData",
        "IPAddress:InternetData",
      ]
    }
    http_chan = make_http_channel
    spawn get_request(WOLFRAM_URL, params, http_chan)
    while http_chan.empty?
      loader.whirl
    end
    loader.clear
    response = http_chan.receive
    raise NoInternetException.new if response.is_a?(Nil)
    raise BadStatusCodeException.new(
      response.status_code.to_s
    ) unless response.status_code == 200
    json_response = JSON.parse(response.body)
    begin
      pods = json_response["queryresult"]["pods"]
    rescue KeyError
      raise UnexpectedJSONException.new
    end
    return summarize(pods)
  end

  # Pulls out important info from the API json
  # and formats into readable text
  private def summarize(pods : JSON::Any) : String
    summary = [] of String
    pods.each do |pod|
      title = pod["title"]
      no_title? = title == ""
      is_result? = title == "Result"
      is_response? = title == "Response"
      pod_title = "#{INDENT}#{title}:"
      added_title? = false
      pod_summary = [] of String
      pod["subpods"].each do |subpod|
        if !is_result? && !is_response? && !added_title?
          pod_summary << pod_title
          added_title? = true
        end
        pod_summary << summarize_subpod(subpod, no_title?, is_result?)
      end
      summary << pod_summary.join('\n')
    end
    return summary.join("\n\n")
      .gsub("Wolfram|Alpha", "miso")
      .gsub("|", "--")
  end

  # Same as #sumarize but for just one subpod
  private def summarize_subpod(subpod, no_title?, is_result?) : String
    sub_summary = ""
    sub_title = subpod["title"]
    description = subpod["plaintext"]
    no_description? = description == ""
    return "" if no_title? && no_description?

    if sub_title != ""
      sub_summary += "#{INDENT}#{INDENT}#{sub_title}:\n"
      indents = "#{INDENT}#{INDENT}#{INDENT}"
    elsif is_result?
      indents = "=> "
    else
      indents = "#{INDENT}#{INDENT}"
    end
    if !no_description?
      formatted_description = "#{indents}#{description}".gsub('\n', "\n#{indents}")
      sub_summary += "#{formatted_description}"
    end
    return sub_summary
  end
end

class NoInternetException < Exception
end

class BadStatusCodeException < Exception
end

class UnexpectedJSONException < Exception
end
