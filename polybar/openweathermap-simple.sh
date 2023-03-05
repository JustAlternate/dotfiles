#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        01d) icon="%{F#50fa7b}%{F-}";;
        01n) icon="%{F#50fa7b}%{F-}";;
        02d) icon="%{F#50fa7b}%{F-}";;
        02n) icon="%{F#50fa7b}%{F-}";;
        03*) icon="%{F#50fa7b}%{F-}";;
        04*) icon="%{F#50fa7b}%{F-}";;
        09d) icon="%{F#50fa7b}%{F-}";;
        09n) icon="%{F#50fa7b}%{F-}";;
        10d) icon="%{F#50fa7b}%{F-}";;
        10n) icon="%{F#50fa7b}%{F-}";;
        11d) icon="%{F#50fa7b}%{F-}";;
        11n) icon="%{F#50fa7b}%{F-}";;
        13d) icon="%{F#50fa7b}%{F-}";;
        13n) icon="%{F#50fa7b}%{F-}";;
        50d) icon="%{F#50fa7b}%{F-}";;
        50n) icon="%{F#50fa7b}%{F-}";;
        *) icon="%{F#50fa7b}%{F-}";

        # Icons for Font Awesome 5 Pro
        #01d) icon="";;
        #01n) icon="";;
        #02d) icon="";;
        #02n) icon="";;
        #03d) icon="";;
        #03n) icon="";;
        #04*) icon="";;
        #09*) icon="";;
        #10d) icon="";;
        #10n) icon="";;
        #11*) icon="";;
        #13*) icon="";;
        #50*) icon="";;
        #*) icon="";
    esac

    echo $icon
}

KEY="931c0adf9dc57fc47e7ba05b6ad8cf9a"
CITY="3014728"
UNITS="metric"
SYMBOL=" °C"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo "$(get_icon "$weather_icon")" "$weather_temp$SYMBOL"
fi
