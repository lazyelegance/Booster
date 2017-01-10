//
//  Question.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import Foundation


struct Question {
    let id: String
    let text: String
    let answers: [Answer]

    
    init(id: String, text: String, answers: [Answer]) {
        self.id = id
        self.text = text
        self.answers = answers
    }
}
