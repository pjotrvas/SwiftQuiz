//
//  Colors.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 09/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import Foundation
import UIKit


enum MyColor {
    
        case science
        case sports

    func description()-> String{
        switch self {
        case .science:
            return "SCIENCE"
        case .sports:
            return "SPORTS"
        }
    }
    
    var category: UIColor {
        return self.value
    }
    
    var value: UIColor {
        switch self {
            case .science:
                return UIColor(red: 67/255, green: 173/255, blue: 247/255, alpha: 1.0)
            case .sports:
                    return UIColor.red
        }
}
}
