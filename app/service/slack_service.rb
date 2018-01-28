# frozen_string_literal: true

class SlackService
  def self.post(slack_url, text)
    uri = URI.parse(slack_url)
    params = { text: text, username: "kakuyasu" }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.start do
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(payload: params.to_json)
      http.request(request)
    end
  end
end
