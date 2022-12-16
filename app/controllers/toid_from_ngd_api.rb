require 'uri'
require 'net/http'
require 'openssl'
require 'json'
# require '../../app.rb'

# Return the TOID of buildings over 18m using the OS NGD API
def tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)
    # coords = params[:council_value[0]], params[:council_value[1]]
    # puts coords.to_s.delete! "[]"
    coords =  $coordinates.to_s.delete! "[]"
    puts coords
    url = URI("https://api.os.uk/features/ngd/ofa/v1/collections/bld-fts-buildingpart/items?bbox=#{coords}&filter=absoluteheightmaximum%20%3E%2018.0&key=CkhkKSjbQD0FoWPnevbA2vdfsBAe1rv8")
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(url)
    request["accept"] = 'application/json'
    response = http.request(request)

    parsed_json = JSON.parse(response.body)
    
    num_of_properties = parsed_json["numberReturned"]
    list_of_building_info = []
    i = 0
    while i < num_of_properties do
        toid = parsed_json["features"][i]["properties"]["toid"]
        res_status = parsed_json["features"][i]["properties"]["oslandusetiera"]
        height = parsed_json["features"][i]["properties"]["absoluteheightmaximum"]
        list_of_building_info.append([toid,res_status,height])
        i += 1
    end
 list_of_building_info
end
