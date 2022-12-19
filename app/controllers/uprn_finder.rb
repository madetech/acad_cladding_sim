require_relative './toid_from_ngd_api.rb'
require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Return the UPRN of buildings using the OS Linked Identifiers API
def uprn_finder(left_bottom_coordinates, top_right_coordinates)
  full_list_of_toids = tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)  # #  returns an array of TOIDs for buildings over 18m within bounding box coordinates using OS NGD API
  first_100_toids = full_list_of_toids[0..99]
  list_of_uprns = []  # Stores returned UPRNs
  
  # Calls the OS Linked Identifier API on each TOID
  first_100_toids.each do |toid|
    url = URI("https://api.os.uk/search/links/v1/identifiers/#{toid[0]}?key=mLoyRCJnzfUA9ViewvB9nUrIE8o0127W")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    response = http.request(request)

    parsed_json = JSON.parse(response.body)
    begin
      uprn = parsed_json["linkedIdentifiers"][0]["correlations"][0]["correlatedIdentifiers"][0]["identifier"]
    rescue NoMethodError
      list_of_uprns.append(["UPRN not available", toid])
      next
    end
    list_of_uprns.append([uprn, toid])
    # sleep 3
  end
  [list_of_uprns, full_list_of_toids.length.to_s]
end

# def total_num_of_buildings(total_num_of_buidlings)
#   total_num_of_buidlings = full_list_of_toids.length
#   total_num_of_buidlings.to_s
# end