//
//  AccessoriesViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 6/6/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class AccessoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var accessories: [Accessories] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let superview = self.view
        
        accessories = Accessories.seedData()
        
        let tableView = UITableView(frame: view.bounds, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(AccessoryCell.self, forCellReuseIdentifier: NSStringFromClass(AccessoryCell.self))
        view.addSubview(tableView)
        tableView.backgroundColor = UIColor(red: 0, green: 0.6431, blue: 0.8588, alpha: 1.0) //UIColor(red: 0, green: 0.698, blue: 0.8392, alpha: 1.0)
//        tableView.snp.makeConstraints { (make) -> Void in
//            //make.top.equalTo(superview!.snp.top)
//            make.top.equalTo(superview!.snp.top).offset(120)
//            //make.centerX.equalTo(superview!)
//        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accessories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell( withIdentifier: NSStringFromClass(AccessoryCell.self), for: indexPath as IndexPath) as! AccessoryCell
        cell.accessory = accessories[indexPath.row]
        
        //cell.imageView?.image = accessories[indexPath.row].image

//        cell.snp.makeConstraints { (make) -> Void in
////            make.top.equalTo(superview!.snp.top).offset(120)
////            make.centerX.equalTo(superview!)
////            make.width.equalTo(30)
////            make.height.equalTo(40)
//        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


class Accessories {
    var name: String = ""
    var description: String = ""
    var image = UIImage()
    var url: String = ""
    
    class func seedData()->[Accessories]{
        var arrayAccessories = [Accessories] ()
        
        let accessoryOne = Accessories()
        accessoryOne.name = "Example One"
        accessoryOne.description = "description one"
        accessoryOne.image = UIImage(named: "image1")!
        accessoryOne.url = "http://www.rockandice.com/"
        
        let accessoryTwo = Accessories()
        accessoryTwo.name = "Example Two"
        accessoryTwo.description = "description two"
        accessoryTwo.image = UIImage(named: "image2")!
        accessoryTwo.url = "https://www.mountainproject.com/"
        
        
        let accessoryThree = Accessories()
        accessoryThree.name = "Example One"
        accessoryThree.description = "description one"
        accessoryThree.image = UIImage(named: "image3")!
        accessoryThree.url = "http://www.climbing.com/people/doctor-of-climbology-13-must-follow-climbing-websites-blogs-and-podcasts/"
        
        arrayAccessories.append(accessoryOne)
        arrayAccessories.append(accessoryTwo)
        arrayAccessories.append(accessoryThree)
        
        return arrayAccessories
    }
}


class AccessoryCell: UITableViewCell {
    
    let padding: CGFloat = 3
    var background: UIView!
    var nameLabel: UILabel!
    var descriptionLabel: UILabel!
    var imageAccessory : UIImageView!
    
    var accessory: Accessories? {
        didSet {
            if let s = accessory {
                background.backgroundColor = UIColor(red: 0, green: 0.8, blue: 0.9098, alpha: 1.0)
                //UIColor(red: 0, green: 0.5255, blue: 0.8784, alpha: 1.0)//.blue
                nameLabel.text = s.name
                descriptionLabel.text = s.description
                imageAccessory.image = s.image
                setNeedsLayout()
            }
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor.clear
        selectionStyle = .none
        
        background = UIView(frame : .zero)
        background.alpha = 0.6
        contentView.addSubview(background)
        
        imageAccessory = UIImageView(frame :.zero)
        imageAccessory.contentMode = .scaleAspectFit
        contentView.addSubview(imageAccessory)
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.white
        contentView.addSubview(nameLabel)
        
        descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.textAlignment = .center
        descriptionLabel.textColor = UIColor.white
        contentView.addSubview(descriptionLabel)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        background.frame = CGRect(x: 0, y : padding, width: frame.width, height : frame.height - 2 * padding)
        imageAccessory.frame = CGRect(x : 0, y: padding, width: 90, height: 90)
        nameLabel.frame = CGRect(x : padding + 115, y: padding, width: 120, height: 25)
        descriptionLabel.frame = CGRect(x : padding + 115 , y: (frame.height - 25)/2 , width: 120, height: 25)
    }
}
