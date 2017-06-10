//
//  AccessoriesViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 6/6/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class AccessoriesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var accessories: [AccessoryModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let superview = self.view
        
        accessories = AccessoryModel.seedData()
        
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
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(self.createViewControllerFrom(accessory : accessories[indexPath.row]), animated: true)
        
    }

    func createViewControllerFrom(accessory :AccessoryModel)->AccessoriesDetailsViewController{
        let accessoriesDetailsViewController = AccessoriesDetailsViewController( accessory: accessory)
        
        //accessoriesDetailsViewController.accesoryData = accessory
        
        return accessoriesDetailsViewController
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


class AccessoryModel {
    var name: String = ""
    var description: String = ""
    var image = UIImage()
    var url: String = ""
    
    class func seedData()->[AccessoryModel]{
        var arrayAccessories = [AccessoryModel] ()
        
        let accessoryOne = AccessoryModel()
        accessoryOne.name = "La Sportiva Miura Lace Climbing Shoe - Men's"
        accessoryOne.description = "This climbing shoe from La Sportiva Miura fuses edging precision, sensitivity, and comfort into one lasting package."
        accessoryOne.image = UIImage(named: "shoe1")!
        accessoryOne.url = "https://www.amazon.com/Sportiva-Climbing-Yellow-Wiregate-Carabiners/dp/B01EGTRGOI/ref=sr_1_64?s=apparel&ie=UTF8&qid=1497068945&sr=1-64&nodeID=7141123011&psd=1&keywords=rock+climbing+shoes"
        
        let accessoryTwo = AccessoryModel()
        accessoryTwo.name = "Evolv Addict Climbing Shoe"
        accessoryTwo.description = "A slipper built for all climbers and for all terrain; the local gyms, Joshua Tree slabs and Indian Creek cracks. Its asymmetrical shape and low toe-profile accommodates all abilities. Beginner/intermediate climbers will fit these with a more relaxed toe curl. Advanced climbers may down size a bit for increased toe power.TRAX Rubber"
        accessoryTwo.image = UIImage(named: "shoe2")!
        accessoryTwo.url = "https://www.amazon.com/Evolv-Addict-Climbing-Shoe-Yellow/dp/B00E41S3O6/ref=sr_1_103?s=apparel&ie=UTF8&qid=1497068963&sr=1-103&nodeID=7141123011&psd=1&keywords=rock+climbing+shoes"
        
        let accessoryThree = AccessoryModel()
        accessoryThree.name = "Chalk Bag for Rock Climbing, Weightlifting, Bouldering & Gymnastics with Drawstring Closure, Quick-clip Belt and Valuables Securely Holding Zippered Pocket - Lifetime Guarantee"
        accessoryThree.description = "Point Break Rock Climbing Chalk Bag, Make you climb to the top easily."
        accessoryThree.image = UIImage(named: "bag1")!
        accessoryThree.url = "https://www.amazon.com/Point-Break-Drawstring-Quick-Clip-Zippered/dp/B01EQ6P39Q/ref=sr_1_145?s=apparel&ie=UTF8&qid=1497068963&sr=1-145-spons&nodeID=7141123011&psd=1&keywords=rock+climbing+shoes&psc=1"
        
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
    
    var accessory: AccessoryModel? {
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
        imageAccessory.backgroundColor = .white
        contentView.addSubview(imageAccessory)
        
        nameLabel = UILabel(frame: .zero)
        nameLabel.textAlignment = .left
        nameLabel.textColor = UIColor.white
        nameLabel.numberOfLines = 0;
        nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        contentView.addSubview(nameLabel)
        
        descriptionLabel = UILabel(frame: .zero)
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = UIColor.white
        descriptionLabel.numberOfLines = 0;
        descriptionLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionLabel.font = UIFont.systemFont(ofSize: 13.0);
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
        imageAccessory.frame = CGRect(x : 0, y: padding, width: frame.height, height: frame.height - 2 * padding)
        nameLabel.frame = CGRect(x : frame.height + 2 * padding , y: padding, width: frame.width - frame.height , height: frame.height / 2)
        descriptionLabel.frame = CGRect(x : frame.height + 2 * padding , y: frame.height / 2 - padding, width: frame.width - frame.height , height: frame.height / 2)//CGRect(x : padding + 115 , y: (frame.height - 25)/2 , width: 320, height: frame.height / 2)
    }
}
