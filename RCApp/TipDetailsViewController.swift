//
//  TipDetailsViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/22/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class TipDetailsViewController: UIViewController {

    @IBOutlet weak var tipImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var moreInfoButton: UIButton!
    
    
    
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    var tip: TipModel?
    var isMenuOpen = false
    
    @IBAction func OpenInBrowser(sender: AnyObject) {
        if let url = NSURL(string: (tip?.sourceUrl)!){
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func copyUrlToClipboard(_ sender: Any) {
        
        UIPasteboard.general.string = tip?.sourceUrl
    }
    
    @IBAction func openMenu(_ sender: UIButton) {
        isMenuOpen = !isMenuOpen
        
        menuHeightConstraint.constant = isMenuOpen ? 75.0 : 30.0
        
        moreInfoButton.isHidden = !isMenuOpen
    
        UIView.animate(withDuration: 1.0, delay: 0,
                       
                       usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0,
                       
                       options: [.curveEaseOut], animations: {
                        
                        self.view.layoutIfNeeded()
                        let angle = self.isMenuOpen ? CGFloat(0.2): 0
                        self.moreInfoButton.transform = CGAffineTransform(rotationAngle: angle)
                        
        }, completion: nil)
        
        
        
//        UIView.animate(withDuration: 0.33, delay: 0,
//                       options: .curveEaseOut,
//                       animations: {
//                            self.view.layoutIfNeeded()
//                        //let angle = self.isMenuOpen ? CGFloat(M_PI_4) : 0
//                        let angle = self.isMenuOpen ? CGFloat(0.5): 0
//                        self.moreInfoButton.transform = CGAffineTransform(rotationAngle: angle)
//                        },
//                       completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moreInfoButton.isHidden = !isMenuOpen
        
        if let selectedTip = tip {
            navigationItem.title = selectedTip.name
            tipImage.image = selectedTip.image
            descriptionLabel.text = selectedTip.information
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // moreInfoButton.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let controller = segue.destination as? SourceDetailsViewController {
            controller.urlReceived = tip?.sourceUrl
        }
    }

}
