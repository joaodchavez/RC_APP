//
//  WeatherDetailsViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 5/20/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit
import SnapKit

class WeatherDetailsViewController: UIViewController {

    var weather: Weather?
    var labelValueAirPressure = UILabel()
    var labelValueApplicableDate = UILabel()
    var labelValueHumidity = UILabel()
    var labelValueMaxTemp = UILabel()
    var labelValueMinTemp = UILabel()
    var labelValueWindSpeed = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let superview = self.view
        superview?.backgroundColor = UIColor(red:0.38, green:0.85, blue:0.88, alpha:1)
        
        // Added title label
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
        titleLabel.text = "Weather Forecast"
        titleLabel.textColor = UIColor.black
        titleLabel.sizeToFit()
        titleLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(superview!.snp.top).offset(80)
            make.centerX.equalTo(superview!)
        }
        
        //Stack View
        let stackView = UIStackView()
        stackView.axis  = UILayoutConstraintAxis.horizontal
        stackView.distribution  = UIStackViewDistribution.equalSpacing
        stackView.alignment = UIStackViewAlignment.center
        
        view.addSubview(stackView)
        
        var incrementColor = 30
        
        //Buttons
        for weatherDaily in (weather?.consolidateWeather)!{
            
            let dayButton: WeatherUIButton = WeatherUIButton()
            dayButton.layer.borderWidth = 1
            dayButton.layer.borderColor = UIColor.white.cgColor
            dayButton.weatherDaily = weatherDaily
            dayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            let blueColor = 50 +  incrementColor
            dayButton.backgroundColor =  UIColor(red: 0, green: 0, blue: CGFloat(blueColor)/255, alpha: 1)
            let dateAsString = weatherDaily.applicableDate
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            
            if let date = dateFormatter.date(from: dateAsString) {
                dateFormatter.dateFormat = "dd-MM"
                print("date is \(dateFormatter.string(from: date))")
                
                dayButton.setTitle("\(dateFormatter.string(from: date))", for: .normal)
            }
            dayButton.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(60)
                make.height.equalTo(50)
            }
            stackView.addArrangedSubview(dayButton)
            
            incrementColor += 30
        }
        
        stackView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(superview!.snp.top).offset(130)
            make.centerX.equalTo(superview!)
        }
        
        //Labels
        let labelAirPressure = UILabel()
        //labelAirPressure.backgroundColor = UIColor.blue
        labelAirPressure.text = "Air Pressure:"
        labelAirPressure.textColor = UIColor.black
        
//        labelValueAirPressure.backgroundColor = UIColor.blue
        labelValueAirPressure.text = "Air Pressure"
        labelValueAirPressure.textColor = UIColor.black
        
        let labelApplicableDate = UILabel()
//        labelApplicableDate.backgroundColor = UIColor.blue
        labelApplicableDate.text = "Applicable Date:"
        labelApplicableDate.textColor = UIColor.black
        
//        labelValueApplicableDate.backgroundColor = UIColor.blue
        labelValueApplicableDate.text = "Applicable Date"
        labelValueApplicableDate.textColor = UIColor.black
        
        let labelHumidity = UILabel()
//        labelHumidity.backgroundColor = UIColor.blue
        labelHumidity.text = "Humidity:"
        labelHumidity.textColor = UIColor.black
        
//        labelValueHumidity.backgroundColor = UIColor.blue
        labelValueHumidity.text = "Humidity"
        labelValueHumidity.textColor = UIColor.black
        
        let labelMaxTemp = UILabel()
//        labelMaxTemp.backgroundColor = UIColor.blue
        labelMaxTemp.text = "Max Temp:"
        labelMaxTemp.textColor = UIColor.black
        
//        labelValueMaxTemp.backgroundColor = UIColor.blue
        labelValueMaxTemp.text = "Max Temp"
        labelValueMaxTemp.textColor = UIColor.black
        
        let labelMinTemp = UILabel()
//        labelMinTemp.backgroundColor = UIColor.blue
        labelMinTemp.text = "Min Temp:"
        labelMinTemp.textColor = UIColor.black
    
//        labelValueMinTemp.backgroundColor = UIColor.blue
        labelValueMinTemp.text = "Min Temp"
        labelValueMinTemp.textColor = UIColor.black
        
        let labelWindSpeed = UILabel()
//        labelWindSpeed.backgroundColor = UIColor.blue
        labelWindSpeed.text = "Wind Speed:"
        labelWindSpeed.textColor = UIColor.black
        
//        labelValueWindSpeed.backgroundColor = UIColor.blue
        labelValueWindSpeed.text = "Wind Speed"
        labelValueWindSpeed.textColor = UIColor.black
        
        view.addSubview(labelAirPressure)
        view.addSubview(labelValueAirPressure)
        view.addSubview(labelApplicableDate)
        view.addSubview(labelValueApplicableDate)
        view.addSubview(labelHumidity)
        view.addSubview(labelValueHumidity)
        view.addSubview(labelMaxTemp)
        view.addSubview(labelValueMaxTemp)
        view.addSubview(labelMinTemp)
        view.addSubview(labelValueMinTemp)
        view.addSubview(labelWindSpeed)
        view.addSubview(labelValueWindSpeed)
        
        labelAirPressure.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.left.equalTo(superview!).offset(20)
        }
        
        labelValueAirPressure.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.right.equalTo(superview!).offset(-20)
        }
        
        labelApplicableDate.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelAirPressure.snp.bottom).offset(20)
            make.left.equalTo(superview!).offset(20)
        }
        
        labelValueApplicableDate.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelValueAirPressure.snp.bottom).offset(20)
            make.right.equalTo(superview!).offset(-20)
        }
        
        labelHumidity.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelApplicableDate.snp.bottom).offset(20)
            make.left.equalTo(superview!).offset(20)
        }
        
        labelValueHumidity.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelValueApplicableDate.snp.bottom).offset(20)
            make.right.equalTo(superview!).offset(-20)
        }
        
        labelMaxTemp.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelHumidity.snp.bottom).offset(20)
            make.left.equalTo(superview!).offset(20)
        }
        
        labelValueMaxTemp.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelValueHumidity.snp.bottom).offset(20)
            make.right.equalTo(superview!).offset(-20)
        }
        
        labelMinTemp.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelMaxTemp.snp.bottom).offset(20)
            make.left.equalTo(superview!).offset(20)
        }
        
        labelValueMinTemp.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelValueMaxTemp.snp.bottom).offset(20)
            make.right.equalTo(superview!).offset(-20)
        }
        
        labelWindSpeed.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelMinTemp.snp.bottom).offset(20)
            make.left.equalTo(superview!).offset(20)
        }
        
        labelValueWindSpeed.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(labelValueMinTemp.snp.bottom).offset(20)
            make.right.equalTo(superview!).offset(-20)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func buttonAction(sender: WeatherUIButton!) {
        labelValueAirPressure.text = String(describing: sender.weatherDaily!.airPressure)
        labelValueApplicableDate.text = String(describing: sender.weatherDaily!.applicableDate)
        labelValueHumidity.text = String(describing: sender.weatherDaily!.humidity)
        labelValueMaxTemp.text = String(describing: sender.weatherDaily!.maxTemp)
        labelValueMinTemp.text = String(describing: sender.weatherDaily!.minTemp)
        labelValueWindSpeed.text = String(describing: sender.weatherDaily!.windSpeed)
    }
}


class WeatherUIButton: UIButton {
    var weatherDaily: WeatherDaily?
}
