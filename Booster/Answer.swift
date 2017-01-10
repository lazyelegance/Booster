//
//  Answer.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import Foundation


struct Answer {
    let id: String
    let text: String
    let score: Int
    
    init(id: String, text: String, score: Int) {
        self.id = id
        self.text = text
        self.score = score
    }
}
