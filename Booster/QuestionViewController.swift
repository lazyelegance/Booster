//
//  QuestionViewController.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var questions: [Question]!
    var isLastQuestion = false
    var questionNumber = 0
    var totalScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = blue
        questionLabel.text = questions[questionNumber].text
        print(isLastQuestion)
        print(totalScore)
        
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.questions[questionNumber].answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "answer", for: indexPath)
        
        cell.textLabel?.text = self.questions[questionNumber].answers[indexPath.row].text
        cell.textLabel?.textColor = white
        
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        cell.contentView.backgroundColor = green
        
        return cell
    }

    
    // MARK: - Navigation
    
    @IBAction func goToPrevious(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let question = self.questions[questionNumber]
        let answer = question.answers[indexPath.row]
        
        if answer.id == "spl1" {
            if let resultVIewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                resultVIewController.score = self.totalScore + answer.score
                resultVIewController.fund = CGF
                self.navigationController?.pushViewController(resultVIewController, animated: true)
            }
        } else if answer.id == "spl2" {
            if let resultVIewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                resultVIewController.score = self.totalScore + answer.score
                resultVIewController.fund = DSF
                self.navigationController?.pushViewController(resultVIewController, animated: true)
            }
        } else if isLastQuestion {
            if let resultVIewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
                resultVIewController.score = self.totalScore + answer.score
                self.navigationController?.pushViewController(resultVIewController, animated: true)
            }
        } else if let questionViewController = self.storyboard?.instantiateViewController(withIdentifier: "QuestionViewController") as? QuestionViewController {
            questionViewController.questions = questions
            questionViewController.questionNumber = self.questionNumber + 1
            questionViewController.totalScore = self.totalScore + answer.score
            if self.questionNumber == questions.count - 2 {
                questionViewController.isLastQuestion = true
            }
            self.navigationController?.pushViewController(questionViewController, animated: true)
        }
    }
}
