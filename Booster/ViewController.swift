//
//  ViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var welcome: UIButton!
    
    @IBAction func welcomeClicked(_ sender: Any) {
        let containerViewController = ContainerViewController()
        self.navigationController?.pushViewController(containerViewController, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationController?.isNavigationBarHidden = true
        view.backgroundColor = blue
        welcome.backgroundColor = green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }

}

