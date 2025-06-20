require 'sinatra/base'
require 'json'

class ApiApp < Sinatra::Base
  # Desabilita TODAS as proteções de segurança do Rack::Protection.
  # Esta é a correção definitiva para o erro "Host not permitted".
  disable :protection

  # Configurações do servidor
  configure do
    set :bind, '0.0.0.0'
  end

  # Endpoint para listar unidades
  get '/list_of_units' do
    content_type :json
    { list_of_units: ['k', 'f', 'c'] }.to_json
  end

  # Endpoint para dobrar o valor
  get '/dobrarValor' do
    content_type :json
    valor = params['valor'].to_i
    { resultado: valor * 2 }.to_json
  end

  # Endpoint raiz para verificar se a API está no ar
  get '/' do
    content_type :json
    { message: 'API em Ruby com Sinatra está no ar!' }.to_json
  end
end 