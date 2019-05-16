//
//  InitialViewController.swift
//  iOSVjestina2019
//
//  Created by Matea Vasilj on 05/04/2019.
//  Copyright © 2019 Matea Vasilj. All rights reserved.
//

import UIKit
import Foundation

class InitialViewController: UIViewController {
    
      var customView: CustomView? = CustomView(frame: CGRect(origin: CGPoint(x: 16, y: 100), size: CGSize(width: 350, height: 350)))
    
    
    
    @objc func test(_ sender: UIButton) {
        let cmp: Int? = Int(sender.titleLabel!.text!.prefix(1))
        print(cmp!)
        if cmp == sender.tag {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
    }
//
//    @objc func btnPrevNextAction(sender: UIButton) {
//        if sender == btnNext && currentQuestionNumber == questionsArray.count {
//            let v=ResultVC()
//            v.score = score
//            v.totalScore = questionsArray.count
//            self.navigationController?.pushViewController(v, animated: false)
//            return
//        }
    
    //outlets from InitialViewControler.xib
    
    
    @IBOutlet weak var GumbDohvati: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var FunFact: UILabel!
    
    @IBOutlet weak var Greska: UILabel!
    
    @IBAction func GumbDohvati(_ sender: UIButton){
        self.customViewContainer.addSubview(self.customView!)
       
        self.customViewContainer.addSubview(self.customView!)
         fetchQuiz()
    }
    
    
    @IBOutlet weak var customViewContainer: UIView!
    

    
    func fetchQuiz() {
       
        
        let urlString = "https://iosquiz.herokuapp.com/api/quizzes"
       
        let quizService = QuizService()
        
        quizService.fetchQuiz(urlString: urlString) { (quiz) in
            DispatchQueue.main.async {
                if let quiz = quiz{
                    let pickOne = Int.random(in: 0 ..< quiz.quiz.count)
                    let background = quiz.quiz[pickOne]["category"] as? String
                    let fromEnum = (background == MyColor.sports.description()) ? MyColor.sports : MyColor.science
                    
                    let quizTitle: UILabel = UILabel(frame: CGRect(origin: CGPoint(x: 100, y: 300), size: CGSize(width: 200, height: 50)))
                    quizTitle.numberOfLines = 0
                    quizTitle.text = quiz.quiz[pickOne]["title"] as? String
                    
                    
                    
                let imageService = ImageService()
                    if let qImage = quiz.quiz[pickOne]["image"] as? String {
                        imageService.fetchImage(urlS: qImage)  { (image) in
                                DispatchQueue.main.async {
                                        let qImageView = UIImageView(image: image)
                                        qImageView.frame = CGRect(x: 50, y: 100, width: 150, height: 100)
                                    
                                    //self.imageView.image = image
                                    self.view.addSubview(qImageView)
                                        qImageView.backgroundColor = fromEnum.value
                            }
                        }
                    }
                    else{
                        
                        }
                    self.view.addSubview(quizTitle)
                    quizTitle.backgroundColor = fromEnum.value
                    quizTitle.textAlignment = NSTextAlignment.center
                    
                    
                    var howManyNBA = 0
                    for quiz in quiz.quiz {
                        if let quests = quiz["questions"] as? [[String:Any]] {
                            let count = quests.filter { (quest) -> Bool in
                                return ((quest["question"] as? String)!.contains("NBA") == true)
                                }.count
                            howManyNBA += count
                        }
                    }
                    
                    self.FunFact.text = "Broj pitanja koja sadrze rijec NBA je " + String(howManyNBA) + "."
                    self.FunFact.sizeToFit()

                    self.FunFact.numberOfLines = 0
                    
                    self.customViewContainer.addSubview(self.customView!)
                    
                    let questions = quiz.quiz[pickOne]["questions"] as? [[String:Any]]
                    let size = questions?.count
                    let num = Int.random(in: 0 ..< size!)
                    
                    self.customView!.label?.text = questions![num]["question"] as? String
                    self.customView!.label?.numberOfLines = 0
                    
                    self.customView!.label?.textAlignment =
                        NSTextAlignment.center
                    
                    let button = questions![num]["answers"] as? [String]
                    
                    self.customView!.button1!.setTitle("1." + button![0], for: UIControl.State.normal)
                    self.customView!.button2?.setTitle("2." +  button![1],for: UIControl.State.normal)
                    self.customView!.button3?.setTitle("3." + button![2],  for: UIControl.State.normal)
                    self.customView!.button4?.setTitle("4." + button![3], for: UIControl.State.normal)
                    
                    let correctAnswer = questions![num]["correct_answer"] as? Int
                    
                    self.customView!.button1!.tag = correctAnswer! + 1
                    self.customView!.button2!.tag = correctAnswer! + 1
                    self.customView!.button3!.tag = correctAnswer! + 1
                    self.customView!.button4!.tag = correctAnswer! + 1
                    
            } else {
                self.Greska.isHidden = false
            }
        }
    }
}
    
   
//This method is called after the view controller has loaded its view hierarchy into memory. This method is called regardless of whether the view hierarchy was loaded from a nib file or created programmatically in the loadView() method. You usually override this method to perform additional initialization on views that were loaded from nib files.
override func viewDidLoad() {
    super.viewDidLoad()
    self.customView!.button1!.addTarget(self, action: #selector(InitialViewController.test), for: UIControl.Event.touchUpInside)
    self.customView!.button2!.addTarget(self, action: #selector(InitialViewController.test), for: UIControl.Event.touchUpInside)
    self.customView!.button3!.addTarget(self, action: #selector(InitialViewController.test), for: UIControl.Event.touchUpInside)
    self.customView!.button4!.addTarget(self, action: #selector(InitialViewController.test), for: UIControl.Event.touchUpInside)

}
}
