//
//  SubmitViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 11/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit

class SubmitViewController: UIViewController {
    
    var finalScore: Int!

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var submit: UIButton!
    
    @IBOutlet weak var done: UIButton!
    @IBOutlet weak var thankYou: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitApplication(_ sender: Any) {
        // validate and implement Submission
        thankYou.alpha = 1
        done.alpha = 1
        name.alpha = 0
        email.alpha = 0
        phone.alpha = 0
        submit.alpha = 0
        headerLabel.alpha = 0
    }

    @IBAction func backToMain(_ sender: Any) {
        if let mainViewController = self.navigationController?.viewControllers[0] as? MainViewController {
            mainViewController.applicationSubmitted = true
            self.navigationController?.popToRootViewController(animated: true)
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

}
