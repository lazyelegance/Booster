//
//  Data.swift
//  Booster
//
//  Created by Ezra Bathini on 11/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import Foundation
import UIKit



let CGFObjective = "The fund's objective is to provide relatively consistent returns, subject to a capital guarantee (see below)\n • It aims to returns (after fee but before tax) of atleast 1.5 % per year above inflation over any tw year period\n • Generally there may be small movements up  and down in the value of the fund\n • The fund invests mainly in income assets, and includes only a small amount of growth assets \n"

//Objective and details are same because lazy!
let CGF = Fund(name: "Capital Guaranteed Fund", type: "Defensive", objective: CGFObjective, image: UIImage(named: "CGF.png")!)
let DSF = Fund(name: "Default Saver Fund", type: "Conservative", objective: CGFObjective, image: UIImage(named: "CGF.png")!)

let BF = Fund(name: "Balanced Fund", type: "Balanced", objective: CGFObjective, image: UIImage(named: "CGF.png")!)
let BGF = Fund(name: "Balanced Growth Fund", type: "Balanced Growth", objective: CGFObjective, image: UIImage(named: "CGF.png")!)
let HGF = Fund(name: "High Growth Fund", type: "Growth", objective: CGFObjective, image: UIImage(named: "CGF.png")!)
let HGF2 = Fund(name: "High Growth Fund", type: "Aggressive Growth", objective: CGFObjective, image: UIImage(named: "CGF.png")!)

let investorTypes = [CGF, DSF, BF, BGF, HGF, HGF2]

let q1text = "When do you plan to make a signiicant lump sum withdrawal from your portfolio, for example, for the purchase of a irst home or for retirement needs? (From age 65 at the earliest)"
let q2text = "Which of the following questions best describes your thoughts about risks and returns?"
let q3text = "Protecting my investment portfolio from a fall in value at any time is more important to me than achieving high returns?"
let q4text = "Consider you have an investment balance of at least $20,000 or more. If after a short period of time (less than 1 year) your balance has dropped in value, which statement relects best how you would feel about this?"
let q5text = "How often would you tend to worry about your investment returns?"

let a11 = Answer(id: "spl1", text: "Within 2 years", score: 1)
let a12 = Answer(id: "spl2", text: "In 2 to 5 years", score: 3)
let a13 = Answer(id: "a11", text: "In 6 to 10 years", score: 5)
let a14 = Answer(id: "a11", text: "In 11 to 20 years", score: 7)
let a15 = Answer(id: "a11", text: "More than 20 years", score: 10)
let a21 = Answer(id: "a11", text: "I want to minimise my risk and am therefore willing to accept low returns", score: 1)
let a22 = Answer(id: "a11", text: "I am willing to take a moderate amount of risk to generate low to medium returns", score: 3)
let a23 = Answer(id: "a11", text: "I am willing to take a reasonable amount of risk to provide a more medium return", score: 5)
let a24 = Answer(id: "a11", text: "In order to receive higher returns, I am willing to take a relatively high amount of risk", score: 7)
let a25 = Answer(id: "a11", text: "I want to maximise my returns and am willing to accept a high level of risk", score: 10)
let a31 = Answer(id: "a11", text: "Strongly Agree", score: 1)
let a32 = Answer(id: "a11", text: "Agree", score: 3)
let a33 = Answer(id: "a11", text: "Neither agree or disagree", score: 5)
let a34 = Answer(id: "a11", text: "Disagree", score: 7)
let a35 = Answer(id: "a11", text: "Strongly Disagree", score: 10)
let a41 = Answer(id: "a11", text: "I would be unhappy with any drop in value", score: 1)
let a42 = Answer(id: "a11", text: "I would be OK with a drop in value of no more than 5%", score: 3)
let a43 = Answer(id: "a11", text: "I would be OK with a drop in value of no more than 10%", score: 5)
let a44 = Answer(id: "a11", text: "I would be OK with a drop in value of up to 15%", score: 7)
let a45 = Answer(id: "a11", text: "I would be OK with a drop in value of up to 20%", score: 10)
let a51 = Answer(id: "a11", text: "Daily", score: 1)
let a52 = Answer(id: "a11", text: "Monthly", score: 3)
let a53 = Answer(id: "a11", text: "Quarterly", score: 5)
let a54 = Answer(id: "a11", text: "Annually", score: 5)
let a55 = Answer(id: "a11", text: "Never or only occasionally over the longer term", score: 1)



let questions = [Question(id: "question1", text: q1text, answers: [a11,a12,a13,a14,a15]),
 Question(id: "question2", text: q2text, answers: [a21,a22,a23,a24,a25]),
 Question(id: "question3", text: q3text, answers: [a31,a32,a33,a34,a35]),
 Question(id: "question4", text: q4text, answers: [a41,a42,a43,a44,a45]),
 Question(id: "question5", text: q5text, answers: [a51,a52,a53,a54,a55])]




