//
//  Weather.swift
//  RCApp
//
//  Created by Joao Chavez on 5/20/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Weather {
    let title : String
    let sunrise: String//Date
    let sources : Array<Sources>
    let locationType : String
    let timeZoneName : String
    let timeZone : String
    let consolidateWeather : Array<WeatherDaily>
    
    init?(JSON inJson: SwiftyJSON.JSON ){
        title = inJson["title"].stringValue
        sunrise = inJson["sun_rise"].stringValue
    
        var sourcesArray = [] as Array<Sources>
        let sourcesSet = inJson["sources"]
        if (sourcesSet != JSON.null) {
            let sourcesJSON = sourcesSet.array
            if (sourcesJSON != nil && sourcesJSON!.count > 0) {
                for source in sourcesJSON! {
                    sourcesArray.append(Sources.init(JSON: source)!)
                }
            }
        }
        sources = sourcesArray
        
        locationType =  inJson["location_type"].stringValue
        timeZoneName = inJson["timezone_name"].stringValue
        timeZone = inJson["timezone"].stringValue
        
        var weatherDailyArray = [] as Array<WeatherDaily>
        let weatherDailySet = inJson["consolidated_weather"]
        if (weatherDailySet != JSON.null) {
            let weatherDailyJSON = weatherDailySet.array
            if (weatherDailyJSON != nil && weatherDailyJSON!.count > 0) {
                for weatherDaily in weatherDailyJSON! {
                    weatherDailyArray.append(WeatherDaily.init(JSON: weatherDaily)!)
                }
            }
        }
        consolidateWeather = weatherDailyArray
    }
    
//    static func createWeatherFromJSON(JSON inJson: SwiftyJSON.JSON) -> Weather {
//        let weather = Weather(JSON: inJson)
//        return weather!
//    }
    
}

struct Sources {
    let title : String
    let slug : String
    let url : String //"http:\/\/www.bbc.co.uk\/weather\/",
    let crawl_rate : Int
    
    init?(JSON inJson: SwiftyJSON.JSON ){
        title = inJson["title"].stringValue
        slug = inJson["slug"].stringValue
        url = inJson["url"].stringValue
        crawl_rate = inJson["crawl_rate"].intValue
    }

}

struct WeatherDaily {
    let airPressure : Int
    let applicableDate : String //Date
    let humidity : Int
    let maxTemp : Double
    let windDirection : Double
    let minTemp : Double
    let windSpeed : Double
    
    init?(JSON inJson: SwiftyJSON.JSON ){
        airPressure = inJson["air_pressure"].intValue
        applicableDate = inJson["applicable_date"].stringValue
        humidity = inJson["humidity"].intValue
        maxTemp = inJson["max_temp"].doubleValue
        windDirection = inJson["wind_direction"].doubleValue
        minTemp = inJson["min_temp"].doubleValue
        windSpeed = inJson["wind_speed"].doubleValue
    }
}


