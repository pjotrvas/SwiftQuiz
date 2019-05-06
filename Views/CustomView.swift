//
//  CustomView.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 06/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//


import UIKit

class CustomView: UIView {

    //properties
    var label : UILabel?
    var button1 : UIButton?
    var button2 : UIButton?
    var button3 : UIButton?
    var button4 : UIButton?
  //  var buttons : [UIButton?] = []

    //initializing our CustomView from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // initializing and configuring subviews from CustomView
        label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 350, height: 60)))
        label?.text = "no question picked yet"
        label?.backgroundColor = UIColor.orange
        label?.font = UIFont.boldSystemFont(ofSize: 15)
        label?.textColor = UIColor.white
        
        let cgRect1 = CGRect.init(x:20, y: 100, width: self.bounds.width*0.4, height: self.bounds.height*0.2)
        let cgRect2 = CGRect.init(x: 180, y: 100, width: self.bounds.width*0.4, height:self.bounds.height*0.2)
        let cgRect3 = CGRect.init(x: 20, y: 200, width: self.bounds.width*0.4, height: self.bounds.height*0.2)
        let cgRect4 = CGRect.init(x: 180, y: 200, width: self.bounds.width*0.4, height: self.bounds.height*0.2)
        
        button1 = UIButton(frame: cgRect1)
        button2 = UIButton(frame: cgRect2)
        button3 = UIButton(frame: cgRect3)
        button4 = UIButton(frame: cgRect4)
        
        //setting button border
        button1?.layer.borderWidth = 4.0
        button1?.layer.borderColor = UIColor.brown.cgColor
        
        button2?.layer.borderWidth = 4.0
        button2?.layer.borderColor = UIColor.brown.cgColor
        
        button3?.layer.borderWidth = 4.0
        button3?.layer.borderColor = UIColor.brown.cgColor
        
        button4?.layer.borderWidth = 4.0
        button4?.layer.borderColor = UIColor.brown.cgColor
      
        //rounding buttons
        button1?.layer.cornerRadius = 8.0
        button2?.layer.cornerRadius = 8.0
        button3?.layer.cornerRadius = 8.0
        button4?.layer.cornerRadius = 8.0
        
        //setting background colors
        button1?.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 0/255, alpha: 0.8)
        button2?.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 0/255, alpha: 0.8)
        button3?.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 0/255, alpha: 0.8)
        button4?.backgroundColor = UIColor(red: 255/255, green: 121/255, blue: 0/255, alpha: 0.8)
        
        // MARK:- setting title text colors
        button1?.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button2?.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button3?.setTitleColor(UIColor.white, for: UIControl.State.normal)
        button4?.setTitleColor(UIColor.white, for: UIControl.State.normal)
       
        // MARK:- setting title font
        button1?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button2?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button3?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button4?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
       
        //seting title alignment
        button1?.titleLabel?.textAlignment = NSTextAlignment.center
        button2?.titleLabel?.textAlignment = NSTextAlignment.center
        button3?.titleLabel?.textAlignment = NSTextAlignment.center
        button4?.titleLabel?.textAlignment = NSTextAlignment.center
        
        //This property controls the maximum number of lines to use in order to fit the label’s text into its bounding rectangle(to remove any maximum limit, and use as many lines as needed, set the value of this property to 0)
        
        button1?.titleLabel?.numberOfLines = 0
        button2?.titleLabel?.numberOfLines = 0
        button3?.titleLabel?.numberOfLines = 0
        button4?.titleLabel?.numberOfLines = 0
        
        if let label = label {
            //Adds a view to the end of the receiver’s list of subviews.
            self.addSubview(label)
        }
        if let firstButton = button1 {
            self.addSubview(firstButton)
        }
        if let secondButton = button2 {
            self.addSubview(secondButton)
        }
        if let thirdButton = button3 {
            self.addSubview(thirdButton)
        }
        if let fourthButton = button4 {
            self.addSubview(fourthButton)
        }
        
        self.backgroundColor = UIColor(red: 255/255, green: 176/255, blue: 50/255, alpha: 0.8)    }
    
    //just a way of satisfying the compiler to assure it that if this class were to have any subclasses, they would inherit or implement this same initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        label = UILabel(frame: CGRect(x: self.bounds.size.width/2,y: 50, width: self.bounds.size.width, height: self.bounds.size.height))
        label?.text = "no question picked yet"
        label?.backgroundColor = UIColor.blue
        label?.textAlignment = NSTextAlignment.center
        label?.font = UIFont.boldSystemFont(ofSize: 20)
        
        
        if let label = label {
            //Adds a view to the end of the receiver’s list of subviews.
            self.addSubview(label)
            
        }
        if let firstButton = button1 {
            self.addSubview(firstButton)
        }
        if let secondButton = button2 {
            self.addSubview(secondButton)
        }
        if let thirdButton = button3 {
            self.addSubview(thirdButton)
        }
        if let fourthButton = button4 {
            self.addSubview(fourthButton)
        }
        
        self.backgroundColor = UIColor(red: 255/255, green: 176/255, blue: 50/255, alpha: 0.8)
        
    }
    
    }
  
