     current_temperature = forecast["currently"]["temperature"]
conditions = forecast["currently"]["summary"]
puts "In Evanston, it is currently #{current_temperature} and #{conditions}"

        # high_temperature = forecast["daily"]["data"][0]["temperatureHigh"]
        # puts high_temperature
        # puts high_temperature = forecast["daily"]["data"][1]["temperatureHigh"]

for day in forecast["daily"]["data"]
    puts "A high temperature of #{day["temperatureHigh"]} and #{day["summary"]}"
end 

    @forecast = ForecastIO.forecast(@lat, @long).to_hash