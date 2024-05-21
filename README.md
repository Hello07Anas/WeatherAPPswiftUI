# Weather Cast App

## Overview
build this app using SwiftUI
Weather Cast App is a simple "weather forecasting" application that displays current weather conditions and a 3-day weather forecast. It also provides detailed hourly forecasts when a specific day is selected. The app dynamically adjusts its appearance based on the time of day.

## Features

### First Screen

1. **Dynamic Background and Font Color**:
   - **Morning (5:00 AM - 6:00 PM)**:
     - Background: Morning background image.
     - Font Color: Black.
   - **Evening (6:00 PM - 5:00 AM)**:
     - Background: Evening background image.
     - Font Color: White.

2. **Layout**:
   - **Top Division**:
     - Displays the name of the current location.
     - Shows the current temperature.
     - Text description of the current weather condition.
     - Maximum and minimum temperatures of the day.
     - Icon representing the current weather condition.
   - **Middle Division**:
     - Title: "3-DAY FORECAST".
     - A list containing:
       - **Today**: Icon, minimum temperature, and maximum temperature.
       - **Tomorrow**: Icon, minimum temperature, and maximum temperature.
       - **Day After Tomorrow**: Icon, minimum temperature, and maximum temperature.
   - **Bottom Division**:
     - Four views displaying:
       - Visibility
       - Humidity
       - Feels like temperature
       - Pressure

### Second Screen

- Triggered when the user clicks on a row in the forecast list.
- Displays an hourly forecast starting from the current hour.
- Lists the hour, weather icon, and current temperature for each hour.

## API

The app uses the WeatherAPI to fetch weather data. The following endpoint provides a 3-day weather forecast with current conditions and hourly data:




Day Mode

https://github.com/Hello07Anas/WeatherAPPswiftUI/assets/120333186/cde72eb4-6bde-433d-8c41-e173dac148cc


Night Mode

https://github.com/Hello07Anas/WeatherAPPswiftUI/assets/120333186/de73e855-4590-468b-b98e-fb02044069e1


