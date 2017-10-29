require "http/client"
require "http/params"

def make_http_channel
  Channel(HTTP::Client::Response | Nil).new(1)
end

def get_request(base_url, params, http_chan)
  uri_params = HTTP::Params.new(params).to_s.gsub('+', "%20")
  final_url = "#{base_url}?#{uri_params}"
  begin
    http_chan.send HTTP::Client.get(final_url)
  rescue Socket::Error
    http_chan.send nil
  end
end
