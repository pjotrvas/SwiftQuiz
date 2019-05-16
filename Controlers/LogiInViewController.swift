//
//  LogiInViewController.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 09/05/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.setValue(UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
        passwordTextField.setValue(UIColor(red: 180/255.0, green: 180/255.0, blue: 180/255.0, alpha: 1.0), forKeyPath: "_placeholderLabel.textColor")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let navBar = self.navBar
        navBar.showBackButton(true)
        navBar.showAddButton(false)
        navBar.showEditButton(false)
    }
    
    @IBAction func onSubmitClick(sender: AnyObject) {
        self.view.endEditing(true)
        if emailTextField.text?.characters.count > 0 && passwordTextField.text?.characters.count > 0 {
            
            RESTEngine.sharedEngine.registerWithEmail(emailTextField.text!, password: passwordTextField.text!, success: { response in
                RESTEngine.sharedEngine.sessionToken = response!["session_token"] as? String
                let defaults = NSUserDefaults.standardUserDefaults()
                defaults.setValue(self.emailTextField.text!, forKey: kUserEmail)
                defaults.setValue(self.passwordTextField.text!, forKey: kPassword)
                defaults.synchronize()
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.showAddressBookViewController()
                }
            }, failure: { error in
                NSLog("Error registering new user: \(error)")
                dispatch_async(dispatch_get_main_queue()) {
                    Alert.showAlertWithMessage(error.errorMessage, fromViewController: self)
                }
            })
        } else {
            let alert = UIAlertController(title: nil, message: "Enter email and password", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    private func showAddressBookViewController() {
        let addressBookViewController = self.storyboard?.instantiateViewControllerWithIdentifier("AddressBookViewController")
        self.navigationController?.pushViewController(addressBookViewController!, animated: true)
    }
}
