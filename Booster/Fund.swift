//
//  Fund.swift
//  Booster
//
//  Created by Ezra Bathini on 10/01/17.
//  Copyright © 2017 Ezra Bathini. All rights reserved.
//

import Foundation
import UIKit

struct Fund {
    let name: String
    let objective: String
    let image: UIImage
    let type: String
    
    init(name: String, type: String, objective: String, image: UIImage) {
        self.name = name
        self.objective = objective
        self.image = image
        self.type = type
    }
}
