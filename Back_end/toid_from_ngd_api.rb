require 'uri'
require 'net/http'
require 'openssl'


def tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)
    url = URI("https://api.os.uk/features/ngd/ofa/v1/collections/bld-fts-buildingpart/items?bbox=3.545237,50.727083,-3.538381,50.728095&key=CkhkKSjbQD0FoWPnevbA2vdfsBAe1rv8")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    
    response = http.request(request)
    parsed_json = JSON.parse(response.body)
    toid = parsed_json["features"][0]["properties"]["toid"]
    puts toid
    #puts parsed_json
    #returned_toids = hash["features"][0][5]
    #puts returned_toids

end


