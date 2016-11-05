require 'httparty'
require 'json'
require 'geocoder'

api_key = ""


puts "What zipcode would you like to know the Forecast for?"
zipcode = gets

lat = Geocoder.search(zipcode)[0].geometry['location']['lat']
lng = Geocoder.search(zipcode)[0].geometry['location']['lng']

url = "https://api.darksky.net/forecast/#{api_key}/#{lat},#{lng}"


#response = HTTParty.get(url, {format: :json})
response = HTTParty.get(url)
#puts "Latitude: #{lat} \t Longitude: #{lng}"

#puts response.body[:currently]


symbol = JSON.parse(response.body, symbolize_names: true)
temp = symbol.dig :currently, :temperature
summary = symbol.dig :minutely, :summary
puts summary + " It's currently #{temp} degrees"
