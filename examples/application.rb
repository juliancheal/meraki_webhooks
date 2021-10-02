require 'meraki_webhooks'

class Application
  def call(env)
    status  = 200
    headers = { "Content-Type" => 'application/json' }
    body    = ["200 => OK"]
    req = Rack::Request.new(env)

    payload = MerakiWebhooks::Payload.new(req.body.read)
    puts payload.raw

    [status, headers, body]
  end
end
