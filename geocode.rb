require "sinatra"
require "sinatra/reloader"
require "geocoder"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

get "/" do
  view "geocode"
end

get "/map" do
    results = Geocoder.search(params["q"])
   lat_long = results.first.coordinates 
   @city = results.first.city
  fullcoordinates = "#{lat_long[0]}, #{lat_long[1]}"
   
  
end 