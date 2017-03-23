//
//  ProblemViewController.swift
//  RCApp
//
//  Created by Joao Chavez on 3/11/17.
//  Copyright © 2017 Fuzz. All rights reserved.
//

import UIKit
import FZAccordionTableView

class ProblemViewController: UIViewController {

    var problem = ProblemModel()
    
    static fileprivate let kTableViewCellReuseIdentifier = "TableViewCellReuseIdentifier"
    @IBOutlet fileprivate var tableView: FZAccordionTableView!
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
            
        tableView.allowMultipleSectionsOpen = true
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: ProblemViewController.kTableViewCellReuseIdentifier)
        tableView.register(UINib(nibName: "AccordionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: AccordionHeaderView.kAccordionHeaderViewReuseIdentifier)
        
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "\(problem.name)"
    }
}



// MARK: - Extra Overrides -

//with this function, I just hide the status bar, not sure why it can be helpful
//maybe for the fzaccordion
extension ProblemViewController {
    override var prefersStatusBarHidden : Bool {
        return true
    }
}

// MARK: - <UITableViewDataSource> / <UITableViewDelegate> -

extension ProblemViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0;
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return AccordionHeaderView.kDefaultAccordionHeaderViewHeight
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView(tableView, heightForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return self.tableView(tableView, heightForHeaderInSection:section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProblemViewController.kTableViewCellReuseIdentifier, for: indexPath)
        cell.textLabel!.text = "Cell"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
tableView.dequeueReusableHeaderFooterView(withIdentifier: AccordionHeaderView.kAccordionHeaderViewReuseIdentifier)
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: AccordionHeaderView.kAccordionHeaderViewReuseIdentifier)
        //add this is different variable, so it's clear for the developer, when he is reading
        let titleLabel = header?.subviews[1].subviews[0] as! UILabel
        
        
        switch section {
        case 0:
            titleLabel.text = "Name"
        case 1:
            titleLabel.text = "Level"
        case 2:
            titleLabel.text = "Beta"
        case 3:
            titleLabel.text = "Image"
        case 4:
            titleLabel.text = "Days left"
            
            
        default:
            print("default")
        }
        return header
    }
}

// MARK: - <FZAccordionTableViewDelegate> -

extension ProblemViewController : FZAccordionTableViewDelegate {
    
    func tableView(_ tableView: FZAccordionTableView, willOpenSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        
    }
    
    func tableView(_ tableView: FZAccordionTableView, didOpenSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        
    }
    
    func tableView(_ tableView: FZAccordionTableView, willCloseSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        
    }
    
    func tableView(_ tableView: FZAccordionTableView, didCloseSection section: Int, withHeader header: UITableViewHeaderFooterView?) {
        
    }
    
    func tableView(_ tableView: FZAccordionTableView, canInteractWithHeaderAtSection section: Int) -> Bool {
        return true
    }
}
