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
        superview?.backgroundColor = UIColor(red: 0, green: 0.5647, blue: 0.9686, alpha: 1.0)
        navigationItem.title = "Weather Forecast"
        
        // Added title label
        let titleLabel = UILabel()
        view.addSubview(titleLabel)
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
        
        //Buttons
        for weatherDaily in (weather?.consolidateWeather)!{
            
            let dayButton: WeatherUIButton = WeatherUIButton()
            
            //Configuration
            dayButton.layer.borderWidth = 1
            dayButton.layer.borderColor = UIColor.white.cgColor
            dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            dayButton.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
            dayButton.titleLabel?.textAlignment = NSTextAlignment.center
            dayButton.backgroundColor =   UIColor(red: 0, green: 0.5137, blue: 0.7176, alpha: 1.0)
            dayButton.setBackgroundImage(
                UIImage(named: getIconName(basedOnAbbreviation: weatherDaily.weatherStateAbbr)) as UIImage?
                , for: UIControlState.normal)

            //Data & targets
            dayButton.weatherDaily = weatherDaily
            dayButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            //Date Format
            dayButton.setTitle("\(getFormatDate(basedOn: weatherDaily.applicableDate))",
                for: .normal)
            
            //Constraints
            dayButton.snp.makeConstraints { (make) -> Void in
                make.width.equalTo(60)
                make.height.equalTo(60)
            }
            stackView.addArrangedSubview(dayButton)
        }
        
        stackView.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(superview!.snp.top).offset(90)
            make.centerX.equalTo(superview!)
        }
        
        //Labels
        
        let labelAirPressure = configureLabel(addingTo : view, elementOnTop: stackView, elementLeft: superview!, elementRight: nil, text: "Air Pressure:", constraintsTop: 20, constraintsLeft: 20, constraintsRight: nil)
        
        labelValueAirPressure = configureLabel(addingTo : view, elementOnTop: stackView, elementLeft: nil, elementRight: superview, text: "Air Pressure", constraintsTop: 20, constraintsLeft: nil, constraintsRight: -20)
        
        let labelApplicableDate = configureLabel(addingTo : view, elementOnTop: labelAirPressure, elementLeft: superview, elementRight: nil, text: "Applicable Date:", constraintsTop: 20, constraintsLeft: 20, constraintsRight: nil)

        labelValueApplicableDate = configureLabel(addingTo : view, elementOnTop: labelAirPressure, elementLeft: nil, elementRight: superview, text: "Applicable Date", constraintsTop: 20, constraintsLeft: nil, constraintsRight: -20)
        
        let labelHumidity = configureLabel(addingTo : view, elementOnTop: labelApplicableDate, elementLeft: superview, elementRight: nil, text: "Humidity:", constraintsTop: 20, constraintsLeft: 20, constraintsRight: nil)
        
        labelValueHumidity = configureLabel(addingTo : view, elementOnTop: labelApplicableDate, elementLeft: nil, elementRight: superview, text: "Humidity", constraintsTop: 20, constraintsLeft: nil, constraintsRight: -20)
        
        let labelMaxTemp = configureLabel(addingTo : view, elementOnTop: labelHumidity, elementLeft: superview, elementRight: nil, text: "Max Temp:", constraintsTop: 20, constraintsLeft: 20, constraintsRight: nil)
        
        labelValueMaxTemp = configureLabel(addingTo : view, elementOnTop: labelValueHumidity, elementLeft: nil, elementRight: superview, text: "Max Temp", constraintsTop: 20, constraintsLeft: nil, constraintsRight: -20)
        
        let labelMinTemp = configureLabel(addingTo : view, elementOnTop: labelMaxTemp, elementLeft: superview, elementRight: nil, text: "Min Temp:", constraintsTop: 20, constraintsLeft: 20, constraintsRight: nil)
        
        labelValueMinTemp = configureLabel(addingTo : view, elementOnTop: labelValueMaxTemp, elementLeft: nil, elementRight: superview, text: "Min Temp", constraintsTop: 20, constraintsLeft: nil, constraintsRight: -20)
        
        let labelWindSpeed = configureLabel(addingTo : view, elementOnTop: labelMinTemp, elementLeft: superview, elementRight: nil, text: "Wind Speed:", constraintsTop: 20, constraintsLeft: 20, constraintsRight: nil)
        
        labelValueWindSpeed = configureLabel(addingTo : view, elementOnTop: labelValueMinTemp, elementLeft: nil, elementRight: superview, text: "Wind Speed", constraintsTop: 20, constraintsLeft: nil, constraintsRight: -20)
            
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
    
    func getIconName(basedOnAbbreviation abbreviation: String)-> String{
        let precipitiation = ["sn", "sl", "h", "t", "hr", "lr", "s"]
        let cloudy = ["hc","lc"]
        var iconName = ""
        
        if precipitiation.contains(abbreviation){
            iconName = WeatherIcon.Rainy.rawValue
        }
        else {
            if cloudy.contains(abbreviation) {
                iconName = WeatherIcon.Cloudy.rawValue
            }
            else {
             iconName = WeatherIcon.Clear.rawValue
            }
        }
        return iconName
    }
    
    func getFormatDate(basedOn date : String) -> String{
        var finalString = ""
        let dateAsString = date
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
    
        if let date = dateFormatter.date(from: dateAsString) {
            dateFormatter.dateFormat = "E dd MM"
            finalString = dateFormatter.string(from: date)
        }
        return finalString
    }
}

class WeatherUIButton: UIButton {
    var weatherDaily: WeatherDaily?
}

func configureLabel(addingTo view: UIView, elementOnTop: UIView, elementLeft: UIView?, elementRight: UIView?, text: String, constraintsTop: Int, constraintsLeft: Int?, constraintsRight: Int?) -> UILabel{

    let label = UILabel()
    label.text = text
    label.textColor = UIColor.darkText

    view.addSubview(label)
    
    label.snp.makeConstraints { (make) -> Void in
        make.top.equalTo(elementOnTop.snp.bottom).offset(constraintsTop)
        
        if let elementLeft = elementLeft {
            make.left.equalTo(elementLeft).offset(constraintsLeft!)
        }
        if let elementRight = elementRight {
            make.right.equalTo(elementRight).offset(constraintsRight!)
        }
    }
     return label
}
