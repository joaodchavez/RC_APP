//
//  WeatherService.swift
//  RCApp
//
//  Created by Joao Chavez on 5/20/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import Foundation
import SwiftyJSON

struct WeatherService {
    
    static func getWeather(completion:@escaping (Weather) -> Void) {
        
        let scriptUrlNewYork = "https://www.metaweather.com/api/location/2459115/"
        
        let urlwithPercentEscapes = scriptUrlNewYork.addingPercentEncoding( withAllowedCharacters: .urlQueryAllowed)
        
        let myUrl = NSURL(string: urlwithPercentEscapes!);
        let request = NSMutableURLRequest(url:myUrl! as URL);
        request.httpMethod = "GET"
        
        var json : JSON?
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil
            {
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("responseString = \(responseString)")
            
            do {
                
                if let data = responseString?.data(using: String.Encoding.utf8.rawValue) {
                    json = JSON(data: data)
                }
                if let httpResponse = response as? HTTPURLResponse {
                    if httpResponse.statusCode == 200 {
                        DispatchQueue.main.async {
                            completion(Weather(JSON: json!)!)
                        }
                        
                    }
                    else {
                        //there is an error message
                        //one solution will be just return a boolean in this function, and check in the view controller, for true or false, and
                        //just show the error message
                        
                        //add another parameter to the completion block, and return an error struct, that will be optional
                    
                    }
                }
                    
                //}
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        
        task.resume()
        
    }
    
}
