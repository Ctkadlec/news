require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "d64fed12f006ff82b881dc8a878a22f1"

forecast = ForecastIO.forecast("#{lat_long[0]}", "#{lat_long[1]}").to_hash

# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`
current_temperature = forecast["currently"]["temperature"]
conditions = forecast["currently"]["summary"]
puts "In , it is currently #{current_temperature} and #{conditions}"
#    high_temperature = forecast["daily"]["data"][0]["temperatureHigh"]
#   puts high_temperature
#  puts high_temperature = forecast["daily"]["data"][1]["temperatureHigh"]

for day in forecast["daily"]["data"]
    puts "A high temperature of #{day["temperatureHigh"]} and #{day["summary"]}"
end 

# Example output:
#
# In Chicago, it is currently 33.89 degress and Clear
# Extended forecast:
# A high temperature of 36.47 and Possible flurries in the afternoon.
# A high temperature of 33.98 and Mostly cloudy throughout the day.
# A high temperature of 33.94 and Possible light snow until evening.
# A high temperature of 32.73 and Mostly cloudy throughout the day.
# A high temperature of 32.51 and Partly cloudy throughout the day.
# A high temperature of 40.42 and Clear throughout the day.
# A high temperature of 23.21 and Overcast throughout the day.
# A high temperature of 29.12 and Clear throughout the day.