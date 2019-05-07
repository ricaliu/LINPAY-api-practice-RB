require 'net/https'
require 'uri'
require 'json'

uri = URI.parse("https://sandbox-api-pay.line.me/v2/payments/oneTimeKeys/pay")

header = { 
    'Content-Type': 'application/json',
    'X-LINE-ChannelId': '1649580251',
    'X-LINE-ChannelSecret': 'ddca54d0f3e50847af3f6ec4fcaef890'
}
body = {
   "productName": "test product",
   "amount": 100,
   "currency": "TWD",
   "orderId": "TW2019-LINE-00002",
   "oneTimeKey": "382391381667700295"
}

# Create the HTTP objects
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
request = Net::HTTP::Post.new(uri.request_uri, header)
request.body = body.to_json

# Send the request
response = http.request(request)
puts response.body