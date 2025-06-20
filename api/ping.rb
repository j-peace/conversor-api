require 'json'
 
def handler(request, response)
  response.status = 200
  response['Content-Type'] = 'application/json'
  response.write({ message: 'pong' }.to_json)
end 