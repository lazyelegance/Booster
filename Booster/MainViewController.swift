//
//  MainViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit

protocol MainViewControllerDelegate {
    func toggleLeftPanel(questionnaireCompleted: Bool)
    func collapseSidePanels()
}

class MainViewController: UIViewController, MenuControllerDelegate {
    
    var delegate: MainViewControllerDelegate?
    var menuExpanded = false
    
    var questionnaireCompleted = false
    
    @IBOutlet weak var fundInformation: UILabel!
    @IBOutlet weak var fundTitle: UILabel!
    
    @IBOutlet weak var fundImageHeader: UILabel!
    
    @IBOutlet weak var fundImage: UIImageView!
    
    var fund: Fund?
    var finalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true

        view.backgroundColor = blue
        
        fundInformation.text = "This Application helps you to find out what type of investment is suited for you. Use the menu button above to access the features"
        fundTitle.alpha = 0
        fundImageHeader.alpha = 0
        fundImage.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        if fund != nil {
            updateFundDetails(fund: fund!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func showMenu(_ sender: Any) {
        if !menuExpanded {
            delegate?.toggleLeftPanel(questionnaireCompleted: self.questionnaireCompleted)
        } else {
            delegate?.collapseSidePanels()
        }
        menuExpanded = !menuExpanded
    }
    
    func updateFundDetails(fund: Fund) {
        fundTitle.alpha = 1
        fundImageHeader.alpha = 1
        fundImage.alpha = 1
        
        fundTitle.text = fund.name
        fundInformation.text = fund.objective
        fundImage.image = fund.image
    }
    
    func menuItemSelected(fund: Fund) {

        menuExpanded = !menuExpanded
        delegate?.collapseSidePanels()
        updateFundDetails(fund: fund)
    }
    
    func startQuestionnaire() {
        menuExpanded = !menuExpanded
        delegate?.collapseSidePanels()
        if let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            questionViewController.questions = questions
            questionViewController.questionNumber = 0
            questionViewController.totalScore = 0
            self.navigationController?.pushViewController(questionViewController, animated: true)
        }
    }
    
    func showSubmitScreen() {
        menuExpanded = !menuExpanded
        delegate?.collapseSidePanels()
        if let submitViewController = self.storyboard?.instantiateViewController(withIdentifier: "SubmitViewController") as? SubmitViewController {
            submitViewController.finalScore = finalScore
            self.navigationController?.pushViewController(submitViewController, animated: true)
        }
    }
    

}
