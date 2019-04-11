//
//  ImageService.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 09/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import Foundation
import UIKit

class ImageService{
    
    //this function accepts String and code block witch accepts UIImage?
    func fetchImage(urlS: String, completion: @escaping ((UIImage?) -> Void)){
        
        //creating URL object from String (failable)
        if let url = URL(string: urlS) {
            
            //we create URLRequest obcject from URL object
            let request = URLRequest(url: url)
            
            //here we create one dataTask object, using dataTask method
            //dataTask accepts URLRequest and function that accepts (Data?, URLResponse?, Error?)
            //after fetching content from URL execution of following code block starts
            // -data- fetched bytes, in this case our image
            //-response- server response (with headers statuses etc.
            //-error-
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
                //fetched image
                if let data = data {
                    let image = UIImage(data: data)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            // end of creating dataTask
            
            // Starting dataTask-a, fetching URL
            dataTask.resume()
        } else {
            completion(nil)
        }
    }
}
