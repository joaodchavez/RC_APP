//
//  TipsCollectionViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/22/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class TipsCollectionViewController: UICollectionViewController {

    let tips = TipModel.seedData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController!.isToolbarHidden = true
        
        // Refresh Control
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(TipsCollectionViewController.refreshControlDidFire), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
        
        // Initial Flow Layout Setup
        let layout = collectionViewLayout as! TipFlowLayout
        let standardItemSize = layout.itemSize.width * layout.standardItemScale
        layout.estimatedItemSize = CGSize(width: standardItemSize, height: standardItemSize)
        layout.minimumLineSpacing = -(layout.itemSize.width * 0.5)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showTipDetailsSegue" {
            let tipDetailViewController = segue.destination as! TipDetailsViewController
            tipDetailViewController.tip = sender as? TipModel
        }
    }
    
    func refreshControlDidFire() {
        collectionView?.reloadData()
        collectionView?.refreshControl?.endRefreshing()
    }
    
    func seedData()->[TipModel]{
        var arrayTips = [TipModel] ()
        
        let tipOne = TipModel()
        tipOne.name = "tip one"
        tipOne.image = UIImage(named: "image1")!
        tipOne.information = "information"

        let tipTwo = TipModel()
        tipTwo.name = "tip one"
        tipTwo.image = UIImage(named: "image2")!
        tipTwo.information = "information"
        
        let tipThree = TipModel()
        tipThree.name = "tip one"
        tipThree.image = UIImage(named: "image3")!
        tipThree.information = "information"
        
        arrayTips.append(tipOne)
        arrayTips.append(tipTwo)
        arrayTips.append(tipThree)
        
        return arrayTips

    }

}



// MARK: UICollectionViewDataSource
extension TipsCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tips.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TipCell", for: indexPath) as! RoundedTipCell
        
        
        let tip = tips[indexPath.item]
        cell.tip = tip
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension TipsCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let tip = tips[indexPath.item]
        performSegue(withIdentifier: "showTipDetailsSegue", sender: tip)
    }
}

