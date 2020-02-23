require "sinatra"
require "sinatra/reloader"
require "geocoder"
require "forecast_io"
require "httparty"
require "news-api"
require "date"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }                                     

# enter your Dark Sky API key here
ForecastIO.api_key = "d64fed12f006ff82b881dc8a878a22f1"

 #news api
 url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=985d8981a4e044b39c073afb6bb9eafa"
 news = HTTParty.get(url).parsed_response.to_hash
# news is now a Hash you can pretty print (pp) and parse for your output


get "/" do
  # show a view that asks for the location
  # use as home file, this should be the text box with a search bar asking for location  

   view "geocode"

end  




get "/map" do

  # do everything else
  # this should have news and weather
 results = Geocoder.search(params["q"])
  lat_long = results.first.coordinates # => [lat, long]
  
 # "#{lat_long[0]} #{lat_long[1]}"
   @city = results.first.city
    @lat = "#{lat_long[0]}"
    @long= "#{lat_long[1]}"
     @forecast = ForecastIO.forecast(@lat, @long).to_hash
    @ftemp = @forecast["currently"]["temperature"]
   @daily =  @forecast ["currently"]["summary"]
    @day = @forecast["daily"]["data"][0]["time"]
   @tommorrowhigh = @forecast["daily"]["data"][1]["temperatureHigh"]
   @day3high = @forecast["daily"]["data"][2]["temperatureHigh"]
   @day4high = @forecast["daily"]["data"][3]["temperatureHigh"]
   @day5high = @forecast["daily"]["data"][4]["temperatureHigh"] 
   @day6high = @forecast["daily"]["data"][5]["temperatureHigh"]
   @day7high = @forecast["daily"]["data"][6]["temperatureHigh"]
   @day2conditions = @forecast["daily"]["data"][1]["summary"]
   @day3conditions = @forecast["daily"]["data"][2]["summary"]
   @day4conditions = @forecast["daily"]["data"][3]["summary"]
   @day5conditions = @forecast["daily"]["data"][4]["summary"]
   @day6conditions = @forecast["daily"]["data"][5]["summary"]
   @day7conditions = @forecast["daily"]["data"][6]["summary"]
   

   @today = @forecast["daily"]["data"][0]["time"]
   @today1 = @forecast["daily"]["data"][1]["time"]
   @today2 = @forecast["daily"]["data"][2]["time"]
   @today3 = @forecast["daily"]["data"][3]["time"]
   @today4 = @forecast["daily"]["data"][4]["time"]
   @today5 = @forecast["daily"]["data"][5]["time"]
   @today6 = @forecast["daily"]["data"][6]["time"]

   @day1 = Time.at(@today).strftime("%A")
   @day2 = Time.at(@today1).strftime("%A")
   @day3 = Time.at(@today2).strftime("%A")
   @day4 = Time.at(@today3).strftime("%A")
   @day5 = Time.at(@today4).strftime("%A")
   @day6 = Time.at(@today5).strftime("%A")
   @day7 = Time.at(@today6).strftime("%A")
   
   @date1 = Time.at(@today).strftime("%m/%d/%y")
   @date2 = Time.at(@today1).strftime("%m/%d/%y")
   @date3 = Time.at(@today2).strftime("%m/%d/%y")
   @date4 = Time.at(@today3).strftime("%m/%d/%y")
   @date5 = Time.at(@today4).strftime("%m/%d/%y")
   @date6 = Time.at(@today5).strftime("%m/%d/%y")
   @date7 = Time.at(@today6).strftime("%m/%d/%y")

   @article1title = news["articles"][0]["title"]
   @article1des = news["articles"][0]["description"]
   @article1url = news["articles"][0]["url"]
   @article2title = news["articles"][1]["title"]
   @article2des = news["articles"][1]["description"]
   @article2url = news["articles"][1]["url"]
    @article3title = news["articles"][2]["title"]
   @article3des = news["articles"][2]["description"]
   @article3url = news["articles"][2]["url"]
    @article4title = news["articles"][3]["title"]
   @article4des = news["articles"][3]["description"]
   @article4url = news["articles"][3]["url"]
    @article5title = news["articles"][4]["title"]
   @article5des = news["articles"][4]["description"]
   @article5url = news["articles"][4]["url"]
   @article1source = news["articles"][0]["source"]["name"]
   @article2source = news["articles"][1]["source"]["name"]
   @article3source = news["articles"][2]["source"]["name"]
   @article4source = news["articles"][3]["source"]["name"]
   @article5source = news["articles"][4]["source"]["name"]
   
    view "ask"
   
 end

