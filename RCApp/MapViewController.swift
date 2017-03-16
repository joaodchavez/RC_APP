//
//  MapViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/11/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Map Screen"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  let controller = segue.destination as? WallViewController {
            
            controller.wallName = "wall one"
        }
    }
}
