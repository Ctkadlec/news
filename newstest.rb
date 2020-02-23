require "geocoder"
require "forecast_io"
require "httparty"


url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=985d8981a4e044b39c073afb6bb9eafa"
news = HTTParty.get(url).parsed_response.to_hash
# news is now a Hash you can pretty print (pp) and parse for your output
puts news["articles"][1]["title"]
puts news["articles"][1]["description"]
puts news["articles"][1]["url"]