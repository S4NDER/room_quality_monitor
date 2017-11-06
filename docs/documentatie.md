# Google/FB login
## oauth2.0
* https://aaronparecki.com/oauth-2-simplified/#creating-an-app

# Data mqtt
## JSON
```
{
    "audio_level": double, optional
    "temp_raw" : double, optional
    "humidity" : double, optional
    "luminosity" : double, optional
    "device_name": string required
}
```

# Models
## Temperture
* double value

## Audio
* double value

## Humidity
* double value

## Luminosity
* double value

## Device
* string device_name
* Temperture temp
* Audio audio
* Humidity humidity
* Luminosity luminosity

## Room
* array devices

## User
* zie gem oauth2
