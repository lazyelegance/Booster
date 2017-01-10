//
//  MenuViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit

protocol MenuControllerDelegate {
    func menuItemSelected(fund: Fund)
    func startQuestionnaire()
    func showSubmitScreen()
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    var delegate: MenuControllerDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewRight: NSLayoutConstraint!
    
    
    @IBOutlet weak var questionnaire: UIButton!
    
    @IBOutlet weak var submit: UIButton!
    
    var questionnaireCompleted = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = green
        tableViewRight.constant = -centerPanelExpandedOffset
        
        
        questionnaire.backgroundColor = questionnaireCompleted ? snow : blue
        questionnaire.isEnabled = questionnaireCompleted ? false : true
        
        submit.backgroundColor = !questionnaireCompleted ? snow : blue
        submit.isEnabled = !questionnaireCompleted ? false : true
        
        
        print("questionnaireCompleted : \(self.questionnaireCompleted)")

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return investorTypes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "investorTypes", for: indexPath)
        
        cell.textLabel?.text = investorTypes[indexPath.row].name
        
        cell.textLabel?.textColor = white
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        
        cell.textLabel?.textAlignment = NSTextAlignment.right
        
        return cell
    }
    

    

   
    // MARK: - Navigation
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.menuItemSelected(fund: investorTypes[indexPath.row])
    }
    
    @IBAction func takeQuestionnaire(_ sender: Any) {
        delegate?.startQuestionnaire()
    }
    
    @IBAction func submitButtonClicked(_ sender: Any) {
        delegate?.showSubmitScreen()
    }

    

}
