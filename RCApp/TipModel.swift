//
//  TipModel.swift
//  RCApp
//
//  Created by Joao Chavez on 3/22/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import Foundation
class TipModel{
    
    var name : String = ""
    var image = UIImage()
    var information : String = ""
    var nameImage : String = ""
    var sourceUrl : String = ""
    
    
    class func seedData()->[TipModel]{
        var arrayTips = [TipModel] ()
        
        let tipOne = TipModel()
        tipOne.name = "tip one"
        tipOne.image = UIImage(named: "image1")!
        tipOne.nameImage = "image1"
        tipOne.information = "information tip One"
        tipOne.sourceUrl = "http://www.rockandice.com/"
        
        let tipTwo = TipModel()
        tipTwo.name = "tip two"
        tipTwo.image = UIImage(named: "image2")!
        tipTwo.nameImage = "image2"
        tipTwo.information = "information tip Two"
        tipTwo.sourceUrl = "https://www.mountainproject.com/"
        
        let tipThree = TipModel()
        tipThree.name = "tip three"
        tipThree.image = UIImage(named: "image3")!
        tipThree.nameImage = "image3"
        tipThree.information = "information tip Three"
        tipThree.sourceUrl = "http://www.climbing.com/people/doctor-of-climbology-13-must-follow-climbing-websites-blogs-and-podcasts/"
        
        arrayTips.append(tipOne)
        arrayTips.append(tipTwo)
        arrayTips.append(tipThree)
        
        return arrayTips
        
    }
}
