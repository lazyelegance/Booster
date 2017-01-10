//
//  ContainerViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit
import QuartzCore

enum SlideOutState {
    case bothCollapsed
    case leftPanelExpanded
    case leftPanelCollapsed
}

class ContainerViewController: UIViewController, MainViewControllerDelegate {
    
    var centerVC: MainViewController!
    var centerNVC: UINavigationController!
    
    var questionnaireCompleted: Bool!
    var applicationSubmitted: Bool!
    
    var currentState: SlideOutState = .bothCollapsed {
        didSet {
            let shouldShowShadow = currentState != .bothCollapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    var leftPanelState: SlideOutState = .leftPanelCollapsed
    
    var leftViewController: MenuViewController?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        centerVC = UIStoryboard.centerViewController()
        centerVC.delegate = self
        
        centerNVC = UINavigationController(rootViewController: centerVC)
        view.addSubview(centerNVC.view)
        addChildViewController(centerNVC)
        centerNVC.didMove(toParentViewController: self)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    func toggleLeftPanel(questionnaireCompleted: Bool, applicationSubmitted: Bool) {
        
        self.questionnaireCompleted = questionnaireCompleted
        self.applicationSubmitted = applicationSubmitted
        let leftPanelNotExpanded = (leftPanelState != .leftPanelExpanded)
        
        if leftPanelNotExpanded {
            
            if (leftViewController == nil) {
                leftViewController = UIStoryboard.leftViewController()
                leftViewController?.questionnaireCompleted = questionnaireCompleted
                leftViewController?.applicationSubmitted = applicationSubmitted
                addChildSidePanelController(leftViewController!)
            }
        }
        
        animateLeftPanel(shouldExpand: leftPanelNotExpanded)
    }
    
    func addLeftPanelViewController() {
        if (leftViewController == nil) {
            leftViewController = UIStoryboard.leftViewController()
            
            addChildSidePanelController(leftViewController!)
        }
    }
    
    func addChildSidePanelController(_ sidePanelController: MenuViewController) {
        
        //*TODO
        sidePanelController.delegate = centerVC
        
        view.insertSubview(sidePanelController.view, at: 0)
        
        addChildViewController(sidePanelController)
        sidePanelController.didMove(toParentViewController: self)
        
        
    }
    
    func animateLeftPanel(shouldExpand: Bool) {
        
        
        if (shouldExpand) {
            
            leftPanelState = .leftPanelExpanded
            
            
            animateCenterPanelXPosition(targetPosition: centerNVC.view.frame.width - centerPanelExpandedOffset)
        } else {
            animateCenterPanelXPosition(targetPosition: 1) { finished in
                self.leftPanelState = .leftPanelCollapsed
                
                self.leftViewController!.view.removeFromSuperview()
                self.leftViewController = nil;
            }
        }
        
        
    }
    
    func animateCenterPanelYPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: {
            self.centerNVC.view.frame.origin.y = targetPosition
        }, completion: completion)
    }
    
    
    func animateCenterPanelXPosition(targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: UIViewAnimationOptions(), animations: {
            self.centerNVC.view.frame.origin.x = targetPosition
        }, completion: completion)
    }
    
    func showShadowForCenterViewController(_ shouldShowShadow: Bool) {
        if (shouldShowShadow) {
            centerNVC.view.layer.shadowOpacity = 0.0
        } else {
            centerNVC.view.layer.shadowOpacity = 0.0
        }
    }
    
    func collapseSidePanels() {
        
        if leftPanelState == .leftPanelExpanded {
            toggleLeftPanel(questionnaireCompleted: self.questionnaireCompleted, applicationSubmitted: self.applicationSubmitted)
        }
    }

}



private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: Bundle.main) }
    
    class func leftViewController() -> MenuViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "MenuViewController") as? MenuViewController
    }

    class func centerViewController() -> MainViewController? {
        return mainStoryboard().instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
    }
}


