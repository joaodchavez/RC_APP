//
//  WallViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/11/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit

class WallViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var wallName = String()
    let wall = WallModel()
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var stackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView() //to remove extra cells
        
        seedData()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")        
        
        //get the number of problems from the api
        //array of problems, with that array create all the buttons
        //add targets for all the buttons?
        addProblemsButtons()
    }

    func addProblemsButtons(){
        
        for problem in wall.problems {
            
            let btn: UIButton = UIButton(frame: CGRect(x: 100, y: 400, width: 100, height: 50))
            btn.backgroundColor = UIColor.green
            btn.setTitle("\(problem.name)", for: .normal)
            btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            //btn.addTarget(self, action: #selector(WallViewController.buttonAction(problem:)), for: .touchUpInside)
            self.stackView.addArrangedSubview(btn)
        }

    }
    
    func buttonAction(sender: UIButton!) {
        if let text = sender.titleLabel?.text {
            self.performSegue(withIdentifier: "ProblemViewControllerSegue", sender: text)
        }
    }

//    func buttonAction(problem : ProblemModel) {
//        //if let text = problem.name{//problemsender.titleLabel?.text {
//            self.performSegue(withIdentifier: "ProblemViewControllerSegue", sender: problem)
//        //}
//    }
//    
    func seedData(){
        let problem = ProblemModel()
        problem.name = "problem one"
        problem.level = "level"
        problem.beta = "beta"
        problem.urlImage = "urlImage"
        problem.daysLeft = "daysLeft"

        let problem2 = ProblemModel()
        problem2.name = "problem two"
        problem2.level = "level"
        problem2.beta = "beta"
        problem2.urlImage = "urlImage"
        problem2.daysLeft = "daysLeft"
        
        wall.description = "example"
        wall.problems.append( problem )
        wall.problems.append( problem2 )
    }
    
    // MARK: TableViewDelegates
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.wall.problems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
        
        cell.textLabel?.text = self.wall.problems[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = self.wall.problems[indexPath.row].name
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "ProblemViewControllerSegue", sender: text)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Wall Screen"
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if  let controller = segue.destination as? ProblemViewController {
            let buttonProblemName = sender! as! String
            var problemSelected = ProblemModel()
            
            for problem in wall.problems {
                if problem.name == buttonProblemName {
                    problemSelected = problem
                }
            }
            controller.problem = problemSelected
            //controller.problem = sender! as! ProblemModel
            }
        }
    
    
}
