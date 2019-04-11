//
//  Quiz.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 05/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import UIKit
import Foundation

//storing our json to dictionary

class Quiz {
    
    let quiz: [[String:Any]]
    
    init?(json: Any) {
        
        if let jsonResponse = json as? [String:Any],
            let jsonDict = jsonResponse["quizzes"] as? [[String:Any]] {
            self.quiz = jsonDict
        } else {
            return nil
        }
        
        
    }
}

