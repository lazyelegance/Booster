//
//  ResultViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 11/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var investorTypeLabel: UILabel!
    
    @IBOutlet weak var investorTypeButton: UIButton!
    
    @IBAction func showInvestorType(_ sender: Any) {
        
        if let mainViewController = self.navigationController?.viewControllers[0] as? MainViewController {
            mainViewController.fund = self.fund
            mainViewController.questionnaireCompleted = true
            mainViewController.finalScore = score
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
    var score = 0
    var fund: Fund?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = "\(score)"
        
        if score >= 5 && score <= 12 {
            self.fund = CGF
        } else if score <= 20 {
            self.fund = DSF
        } else if score <= 29 {
            self.fund = BF
        } else if score <= 37 {
            self.fund = BGF
        } else if score <= 44 {
            self.fund = HGF
        } else if score <= 50 {
            self.fund = HGF2
        }
        
        
        investorTypeButton.backgroundColor = green
        investorTypeButton.setTitle("\(fund!.type) Investor", for: .normal)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
