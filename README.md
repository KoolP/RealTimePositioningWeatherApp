# Real-time Positioning Weather App

WeatherAPP that gives weather conditions based on users position via GPS

How to use:
If you are testing the app via Simulator, 
please update your phone positions via Debug->Simulate Location,
to see the automatic location positionin in action.
Uses Alamofire in one request and Swift 4 codable in another

Description:
Weather app that fetches OpenWeather API and automatically updates current weather conditions and temperature for user,
based on the latitude and longitude position measurements that are fetched when app is launched and if user changes
her location positioning will update.

Features:
- OpenWeathermap.org API requests
- Uses GPS, CLONASS, Wifi and other location systems that iOS Location services provides
- API fetches for latitude longitude, temperature, hourly temperature, City etc. data from OpenWeather.com
- Imaginary sign for commuters that tells if weather allows for biking
- Search weather conditions for any city in the world provided by OpenWeathermap.org
