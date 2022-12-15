require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Return the TOID of buildings over 18m using the OS NGD API
def tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)
    url = URI("https://api.os.uk/features/ngd/ofa/v1/collections/bld-fts-buildingpart/items?bbox=3.545237,50.727083,-3.538381,50.728095&filter=absoluteheightmaximum%20%3E%2018.0&key=CkhkKSjbQD0FoWPnevbA2vdfsBAe1rv8")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    response = http.request(request)

    parsed_json = JSON.parse(response.body)
    
    list_of_toids = []
    i = 0
    while i < 6 do  # Limit the number to TOIDs returned
        toid = parsed_json["features"][i]["properties"]["toid"]
        list_of_toids.append(toid)
        i += 1
    end
    list_of_toids
end
