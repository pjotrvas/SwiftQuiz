//
//  ViewController.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 11/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var window: UIWindow?
    var userDef = UserDefaults.standard
    var errorUsingLogin = false
    struct Keys {
        static let token = "token"
        static let id = "user_id"
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Quiz"
        self.view.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 50/255, alpha: 0.7)
        
        setupViews()
    }
    @objc func btnGetStartedAction(_ sender: UIButton) {
        
        // let v=InitialViewController()
        if (username1.text?.isEmpty)! || (pass.text?.isEmpty)!  {
            displayMessage(userMessage: "All fields must be filled in!")
            return
        }
        else if errorUsingLogin {
            displayMessage(userMessage: "Please insert correct username and password")
        }
        else{
            logSession()
            let v=InitialViewController()
            self.navigationController?.pushViewController(v, animated: true)
        }
        
    }
    
    
    func setupViews() {
        self.view.addSubview(lblTitle)
        lblTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 100).isActive=true
        lblTitle.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        lblTitle.widthAnchor.constraint(equalToConstant: 250).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 80).isActive=true
        
        
        self.view.addSubview(username1)
        username1.heightAnchor.constraint(equalToConstant: 50).isActive=true
        username1.widthAnchor.constraint(equalToConstant: 200).isActive=true
        username1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        username1.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300).isActive=true
        
        self.view.addSubview(pass)
        pass.heightAnchor.constraint(equalToConstant: 50).isActive=true
        pass.widthAnchor.constraint(equalToConstant: 200).isActive=true
        pass.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        pass.topAnchor.constraint(equalTo: username1.bottomAnchor, constant: 10).isActive=true
        
        
        
        self.view.addSubview(btnGetStarted)
        btnGetStarted.heightAnchor.constraint(equalToConstant: 50).isActive=true
        btnGetStarted.widthAnchor.constraint(equalToConstant: 200).isActive=true
        btnGetStarted.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive=true
        btnGetStarted.topAnchor.constraint(equalTo:pass.bottomAnchor ,constant: 15).isActive=true
        
        
    }
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text="Quiz App"
        lbl.textColor=UIColor.white
        lbl.textAlignment = .center
        lbl.font = UIFont.boldSystemFont(ofSize: 55)
        lbl.numberOfLines=2
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    
    let username1: UITextField = {
        let user = UITextField()
        user.placeholder = "username"
        user.textAlignment = .center
        user.textColor = UIColor.black
        user.backgroundColor = .white
        user.translatesAutoresizingMaskIntoConstraints=false
        user.layer.masksToBounds=true
        user.layer.borderWidth = 4.0
        user.layer.borderColor = UIColor.brown.cgColor
        user.layer.cornerRadius = 8.0
        user.text = ""
        return user
        
    }()
    
    let pass: UITextField = {
        let pass = UITextField()
        pass.placeholder = "password"
        pass.textAlignment = .center
        pass.textColor = UIColor.black
        pass.backgroundColor = .white
        pass.translatesAutoresizingMaskIntoConstraints=false
        pass.layer.masksToBounds=true
        pass.layer.borderWidth = 4.0
        pass.layer.borderColor = UIColor.brown.cgColor
        pass.layer.cornerRadius = 8.0
        pass.isSecureTextEntry = true
        pass.text=""
        return pass
        
    }()
    
    let btnGetStarted: UIButton = {
        let btnLogin=UIButton()
        //            btnLogin.layer.borderWidth = 4.0
        //            btnLogin.layer.borderColor = UIColor.brown.cgColor
        btnLogin.setTitle("Sign up", for: .normal)
        btnLogin.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        btnLogin.setTitleColor(UIColor.white, for: .normal)
        btnLogin.backgroundColor=UIColor.brown
        btnLogin.layer.cornerRadius=7
        btnLogin.layer.masksToBounds=true
        btnLogin.translatesAutoresizingMaskIntoConstraints=false
        btnLogin.addTarget(self, action: #selector(btnGetStartedAction), for: .touchUpInside)
        return btnLogin
    }()
    
    
    //    func saveUserDefaults(){
    //        defaults.set(username.text!, forKey: Keys.username)
    //        defaults.set(pass.text!, forKey: Keys.pass)
    //    }
    //
    //    func checkForSaved(){
    //        let name = defaults.value(forKey: Keys.username) as? String
    //        username.text = name
    //        let password = defaults.value(forKey: Keys.pass) as? String
    //        pass.text = password
    //    }
    
    func displayMessage(userMessage:String) -> Void {
        DispatchQueue.main.async
            {
                let alertController = UIAlertController(title: "Alert", message: userMessage, preferredStyle: .alert)
                
                let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
                    DispatchQueue.main.async
                        {
                            self.dismiss(animated: true, completion: nil)
                    }
                }
                alertController.addAction(OKAction)
                self.present(alertController, animated: true, completion:nil)
        }
    }
    
    
    func logSession(){
        let user = username1.text
        let passwordic = pass.text
        let urlString = "https://iosquiz.herokuapp.com/api/session"
        
        if let url = URL(string: urlString) {
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            
            let bodyData = "username=" + user! + "&password=" + passwordic!
            request.httpBody = bodyData.data(using: String.Encoding.utf8);
            
            let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error)
                
                in
                if let data = data{
                    do{
                        let json = try JSONSerialization.jsonObject(with: data, options: [])
                        
                        if let jsonResponse = json as? [String: Any] ,
                            let jsonDict = jsonResponse["errors"] as? [String:Any] {
                            // print(responseJSON)
                            
                            let jsonPassInc = jsonDict["password"] as? [String]
                            
                            //  print(jsonPassInc)
                            
                            if jsonPassInc![0] == "is incorrect" {
                                
                                print("bla")
                                
                                DispatchQueue.main.async {
                                    
                                    
                                    self.displayMessage(userMessage: "error")
                                    self.errorUsingLogin = true
                                }
                                
                            }
                            
                        }else{
                            if let jsonResponse2 = json as? [String:Any]{
                                let token = jsonResponse2["token"] as? String
                                let user_id = jsonResponse2["user_id"] as? Int
                                self.userDef.set(token, forKey: Keys.token)
                                self.userDef.set(user_id, forKey: Keys.id)
                            }else{
                                return
                            }
                        }
                    } catch{
                        self.displayMessage(userMessage: "error")
                        self.errorUsingLogin = true
                    }
                }else{
                    self.displayMessage(userMessage: "error")
                    self.errorUsingLogin = true
                }
            }
            dataTask.resume()
        }
        else{
            self.displayMessage(userMessage: "error")
            errorUsingLogin = true
            
        }
        
    }
    
}


