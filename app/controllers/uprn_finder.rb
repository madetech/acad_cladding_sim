require_relative './toid_from_ngd_api.rb'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Return the UPRN of buildings using the OS Linked Identifiers API
def uprn_finder(left_bottom_coordinates, top_right_coordinates)
  list_of_toids = tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)  # #  returns an array of TOIDs for buildings over 18m within bounding box coordinates using OS NGD API

  list_of_uprns = []  # Stores returned UPRNs
  
  # Calls the OS Linked Identifier API on each TOID
  list_of_toids.each do |toid|
    url = URI("https://api.os.uk/search/links/v1/identifiers/#{toid}?key=uC1mK51yDRfOQsisddsA9y885V0pAfxn")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    response = http.request(request)

    parsed_json = JSON.parse(response.body)
    begin
      uprn = parsed_json["linkedIdentifiers"][0]["correlations"][0]["correlatedIdentifiers"][0]["identifier"]
    rescue NoMethodError
      list_of_uprns.append("UPRN not available")
      next
    end
    list_of_uprns.append(uprn)
    sleep 3
  end
  list_of_uprns
end
