//
//  MainScreenViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/12/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class MainScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Main Screen"
    }
    
    @IBAction func weatherButtonAction(_ sender: Any) {
    
        WeatherService.getWeather(completion: { weather in
            self.navigationController?.pushViewController(self.createViewControllerFrom(weather: weather), animated: true)
        })
    }
    
    func createViewControllerFrom(weather:Weather)->WeatherDetailsViewController{
        let weatherDetailsViewController = WeatherDetailsViewController()
        
        weatherDetailsViewController.weather = weather
        
        return weatherDetailsViewController
    }

}
