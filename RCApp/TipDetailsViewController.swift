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
    @IBOutlet weak var copyUrlButton: UIButton!
    @IBOutlet weak var openInBrowserButton: UIButton!
    
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
        copyUrlButton.isHidden = !isMenuOpen
        openInBrowserButton.isHidden = !isMenuOpen
        
        if isMenuOpen {
            if let image = UIImage(named: "ic_expand_less") {
                sender.setImage(image, for: .normal)
            }
        }
        else {
            if let image = UIImage(named: "ic_expand_more") {
                sender.setImage(image, for: .normal)
            }
        }
    
        UIView.animate(withDuration: 0.7, delay: 0,
                       usingSpringWithDamping: 0.4, initialSpringVelocity: 8.0,
                       options: [.curveEaseInOut], animations: {
                        
                        self.view.layoutIfNeeded()
                        let angle = self.isMenuOpen ? CGFloat(0): 0
                        self.moreInfoButton.transform = CGAffineTransform(rotationAngle: angle)
                        self.copyUrlButton.transform = CGAffineTransform(rotationAngle: angle)
                        self.openInBrowserButton.transform = CGAffineTransform(rotationAngle: angle)
                        
        }, completion: nil)
        
        
        
//        UIView.animate(withDuration: 0.33, delay: 0,
//                       options: .curveEaseOut,
//                       animations: {
//                        self.view.layoutIfNeeded()
//                        },
//                       completion: nil)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        moreInfoButton.isHidden = !isMenuOpen
        copyUrlButton.isHidden = !isMenuOpen
        openInBrowserButton.isHidden = !isMenuOpen
        
        if let selectedTip = tip {
            navigationItem.title = selectedTip.name
            tipImage.image = selectedTip.image
            descriptionLabel.text = selectedTip.information
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
