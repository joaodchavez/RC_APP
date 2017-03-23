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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var tip: TipModel?
    
    @IBAction func OpenInBrowser(sender: AnyObject) {
        if let url = NSURL(string: (tip?.sourceUrl)!){
            UIApplication.shared.openURL(url as URL)
        }
    }
    
    @IBAction func copyUrlToClipboard(_ sender: Any) {
        
        UIPasteboard.general.string = tip?.sourceUrl
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let selectedTip = tip {
            tipImage.image = selectedTip.image
            titleLabel.text = selectedTip.name
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
