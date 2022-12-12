require_relative './toid_from_ngd_api.rb'
require 'uri'
require 'net/http'
require 'openssl'
require 'JSON'

def uprn_finder(left_bottom_coordinates, top_right_coordinates)
  list_of_toids = tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)
  list_of_uprns = []

  list_of_toids.each do |toid|

    url = URI("https://api.os.uk/search/links/v1/identifiers/#{toid}?key=uC1mK51yDRfOQsisddsA9y885V0pAfxn")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
  
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
  
    response = http.request(request)
    parsed_json = JSON.parse(response.body)
    uprn = parsed_json["linkedIdentifiers"][0]["correlations"][0]["correlatedIdentifiers"][0]["identifier"]
    list_of_uprns.append(uprn)
    puts list_of_uprns
  end
end