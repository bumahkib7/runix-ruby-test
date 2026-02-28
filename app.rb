require 'sinatra/base'
require 'json'

class App < Sinatra::Base
  set :bind, '0.0.0.0'
  set :port, ENV.fetch('PORT', 3000).to_i

  get '/' do
    content_type :json
    { service: 'runix-ruby-test', runtime: 'ruby', status: 'ok', timestamp: Time.now.iso8601 }.to_json
  end

  get '/health' do
    content_type :json
    { healthy: true }.to_json
  end
end
