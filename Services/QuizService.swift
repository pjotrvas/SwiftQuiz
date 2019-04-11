//
//  QuizService.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 04/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//


import UIKit
import Foundation

//fetching quizzess from API(json)

class QuizService {
    
    func fetchQuiz(urlString: String, completion: @escaping ((Quiz?) -> Void)) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let data = data {
                    do {
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        let quiz = Quiz(json: json)
                        completion(quiz)
                    } catch {
                        completion(nil)
                    }
                } else {
                    completion(nil)
                }
            }
            dataTask.resume()
        } else {
            completion(nil)
        }
        
    }
}

