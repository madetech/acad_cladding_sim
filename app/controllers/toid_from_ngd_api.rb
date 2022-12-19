require 'uri'
require 'net/http'
require 'openssl'
require 'json'

# Return the TOID of buildings over 18m using the OS NGD API
def tall_building_toid_finder(left_bottom_coordinates, top_right_coordinates)
    coords =  $coordinates.to_s.delete! "[]"
    offset_amount = 0
    num_of_results = 100
    list_of_building_info = []

    while num_of_results == 100
        url = URI("https://api.os.uk/features/ngd/ofa/v1/collections/bld-fts-buildingpart/items?bbox=#{coords}&filter=absoluteheightmaximum%20%3E%2018.0&offset=#{offset_amount.to_s}&key=CkhkKSjbQD0FoWPnevbA2vdfsBAe1rv8")
        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(url)
        request["accept"] = 'application/json'
        response = http.request(request)

        parsed_json = JSON.parse(response.body)
    
        num_of_results = parsed_json["numberReturned"]
        
        i = 0
        while i < num_of_results do
            toid = parsed_json["features"][i]["properties"]["toid"]
            res_status = parsed_json["features"][i]["properties"]["oslandusetiera"]
            height = parsed_json["features"][i]["properties"]["absoluteheightmaximum"]
            list_of_building_info.append([toid,res_status,height])
            i += 1
        end
        offset_amount += 100
    end
 list_of_building_info
end
