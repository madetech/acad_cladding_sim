require_relative './toid_from_ngd_api.rb'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Return the UPRN of buildings using the OS Linked Identifiers API
def uprn_finder()
  full_list_of_ngd_info = tall_building_finder()  # returns an array of toid, residential status and height for each building over 18m within bounding box coordinates (uses OS NGD API)
  first_100_buildings_ngd_info = full_list_of_ngd_info[0..99]  # Set number of results to display
  first_100_buildings_info_with_uprn = []  # Stores returned UPRNs
  
  # Calls the OS Linked Identifier API on each toid
  first_100_buildings_ngd_info.each do |toid_resstatus_height|
    url = URI("https://api.os.uk/search/links/v1/identifiers/#{toid_resstatus_height[0]}?key=mLoyRCJnzfUA9ViewvB9nUrIE8o0127W")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    response = http.request(request)

    parsed_json = JSON.parse(response.body)
    begin
      uprn = parsed_json["linkedIdentifiers"][0]["correlations"][0]["correlatedIdentifiers"][0]["identifier"]
    rescue NoMethodError
      first_100_buildings_info_with_uprn.append(["UPRN not available", toid_resstatus_height])
      next
    end
    first_100_buildings_info_with_uprn.append([uprn, toid_resstatus_height])
  end
  [first_100_buildings_info_with_uprn, full_list_of_ngd_info.length.to_s]
end
