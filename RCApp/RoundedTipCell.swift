//

//  Character Collector
//
//  Created by Michael Briscoe on 2/3/17.
//  Copyright © 2017 Razeware, LLC. All rights reserved.
//

import UIKit

class RoundedTipCell: UICollectionViewCell {
  @IBOutlet weak var tipImage: UIImageView!
  @IBOutlet weak var tipTitle: UILabel!
  
    
  var tip: TipModel? {
    didSet {
      if let tipElement = tip {
        tipImage.image = UIImage(named: tipElement.nameImage)
        tipTitle.text = tipElement.name
      }
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
        
    self.layer.cornerRadius = self.frame.size.width * 0.125
    self.layer.borderWidth = 6
    self.layer.borderColor = UIColor(red: 0.5, green: 0.47, blue: 0.25, alpha: 1.0).cgColor
  }
  
  override func prepareForReuse() {
    super.prepareForReuse()
    tipImage.image = nil
    tipTitle.text = ""
  }
  
}
