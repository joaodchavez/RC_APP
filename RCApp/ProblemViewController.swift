//
//  ProblemViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/11/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class ProblemViewController: UIViewController {

    //var problemName = String()
    //var problemName = String()
    var problem = ProblemModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(problem.name)"
    }

}
