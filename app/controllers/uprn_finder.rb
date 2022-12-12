require_relative './toid_from_ngd_api.rb'
require 'uri'
require 'net/http'
require 'openssl'
require 'JSON'

def uprn_finder(left_bottom_coordinates, top_right_coordinates)
  list_of_toids = tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)
  list_of_uprns = []

  url = URI("https://api.os.uk/search/links/v1/identifiers/osgb1000012979300?key=uC1mK51yDRfOQsisddsA9y885V0pAfxn")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  
  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  
  response = http.request(request)
  parsed_json = JSON.parse(response.body)
  uprn = parsed_json["linkedIdentifiers"][2]
  puts uprn
end