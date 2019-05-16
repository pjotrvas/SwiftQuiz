//
//  ActivityIndicator.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 07/05/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import UIKit

class ActivityIndicator: UIViewController {

    var myActivityIndicator : UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func startButtonTapped(sender : AnyObject){
        
        self.myActivityIndicator = UIActivityIndicatorView(frame: CGRectMake (100, 100, 100, 100)) as
        UIActivityIndicatorView;
        
        self.myActivityIndicator.activityIndicatorViewStyle  = UIActivityIndicatorViewStyle.Gray
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
