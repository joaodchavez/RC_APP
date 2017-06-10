//
//  AccessoriesDetailsViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 6/9/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class AccessoriesDetailsViewController: UIViewController {
    
    var accesoryData : AccessoryModel?
    var descriptionLabel = UILabel()
    var accessoryImage = UIImageView()
    
    init(accessory : AccessoryModel) {
        self.accesoryData = accessory
        self.descriptionLabel.text = accessory.description
        self.accessoryImage.image = accessory.image
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let superview = self.view
        superview?.backgroundColor = .white
        navigationItem.title = accesoryData?.name
        
        //description
        view.addSubview(descriptionLabel)
        descriptionLabel.textColor = UIColor.black
        //descriptionLabel.sizeToFit()
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.font = UIFont.systemFont(ofSize: 16.0);
        descriptionLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(superview!.snp.top).offset(80)
            make.centerX.equalTo(superview!)
            make.height.equalTo(120)
            make.width.equalTo(320)
        }
        
        //image
        view.addSubview(accessoryImage)
        accessoryImage.contentMode = .scaleAspectFit
        accessoryImage.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(20)
            make.centerX.equalTo(superview!)
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
