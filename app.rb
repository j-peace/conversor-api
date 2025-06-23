require 'sinatra/base'
require 'json'

class ApiApp < Sinatra::Base
  # set host authorization to all environments
  set :host_authorization, { permitted_hosts: [] }
  configure :development do
    set :host_authorization, { permitted_hosts: [] }
  end
  configure :production do
    set :host_authorization, { permitted_hosts: [".fly.dev"] }
  end

  get '/' do
    content_type :json
    { message: 'API em Ruby wiht Sinatra is running!' }.to_json
  end

  get '/list_of_units' do
    content_type :json
    { list_of_units: ['K', 'F', 'C', 'N'] }.to_json
  end

  get '/conversion' do
    content_type :json
    return { converted_temp: params['temperatureInCelsius'].to_f - 5 }.to_json if params['targetUnit'] == "F"
    return { converted_temp: params['temperatureInCelsius'].to_f + 10 }.to_json if params['targetUnit'] == "K"
    return { converted_temp: params['temperatureInCelsius'].to_f + 5 }.to_json if params['targetUnit'] == "N"
    return { converted_temp: params['temperatureInCelsius'].to_f }.to_json
  end
end 
