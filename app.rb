require 'sinatra'
require 'json'

# Desabilita TODAS as proteções de segurança do Rack::Protection.
# Isso resolve o erro "Host not permitted".
disable :protection

# Roda o servidor em todas as interfaces de rede, necessário para o Docker
set :bind, '0.0.0.0'

# Endpoint principal para dobrar o valor
get '/dobrarValor' do
  content_type :json

  # Pega o parâmetro 'valor' da URL, converte para inteiro
  valor = params['valor'].to_i

  # Retorna o resultado em formato JSON
  { resultado: valor * 2 }.to_json
end

# Endpoint raiz para verificar se a API está no ar
get '/' do
  content_type :json
  { message: 'API em Ruby com Sinatra está no ar!' }.to_json
end 