require 'httpclient'
require 'json'

uri = "https://www.googleapis.com/books/v1/volumes?q=isbn:4839962227"
params = {
 format: "json"
}

client = HTTPClient.new
request =  client.get(uri,params)
response = JSON.parse(request.body)
puts response
