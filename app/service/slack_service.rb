class SlackService
  def self.slack_post(text)
    uri = URI.parse(ENV['SLACK_URL'])
    params = { text: text, username: 'kakuyasu' }
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.start do
      request = Net::HTTP::Post.new(uri.path)
      request.set_form_data(payload: params.to_json)
      http.request(request)
    end
  end
end
