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
   
    //initializing our CustomView from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // initializing and configuring subviews from CustomView
        label = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 350, height: 60)))
        label?.text = "no question picked yet"
        label?.backgroundColor = UIColor.blue
        
        let cgRect1 = CGRect.init(x:20, y: 100, width: self.bounds.width*0.4, height: self.bounds.height*0.2)
        let cgRect2 = CGRect.init(x: 180, y: 100, width: self.bounds.width*0.4, height:self.bounds.height*0.2)
        let cgRect3 = CGRect.init(x: 20, y: 200, width: self.bounds.width*0.4, height: self.bounds.height*0.2)
        let cgRect4 = CGRect.init(x: 180, y: 200, width: self.bounds.width*0.4, height: self.bounds.height*0.2)
        
       button1 = UIButton(frame: cgRect1)
        button2 = UIButton(frame: cgRect2)
        button3 = UIButton(frame: cgRect3)
        button4 = UIButton(frame: cgRect4)
        
        //setting background colors
        button1?.backgroundColor = UIColor.darkGray
        button2?.backgroundColor = UIColor.darkGray
        button3?.backgroundColor = UIColor.darkGray
        button4?.backgroundColor = UIColor.darkGray
        
        //setting title text colors
        button1?.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button2?.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button3?.setTitleColor(UIColor.red, for: UIControl.State.normal)
        button4?.setTitleColor(UIColor.red, for: UIControl.State.normal)
        
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
        
        self.backgroundColor = UIColor.lightGray
    }
    
    //just a way of satisfying the compiler to assure it that if this class were to have any subclasses, they would inherit or implement this same initializer
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        label = UILabel(frame: CGRect(x: self.bounds.size.width/2,y: 50, width: self.bounds.size.width, height: self.bounds.size.height))
        label?.text = "no question picked yet"
        label?.backgroundColor = UIColor.yellow
        label?.textAlignment = NSTextAlignment.center
        
        
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
        
        self.backgroundColor = UIColor.lightGray
        
    }
    
    }
  
