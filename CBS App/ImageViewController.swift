//
//  ImageViewController.swift
//  Quiz Masters
//
//  Created by J. Ruof, Meruca on 07/09/15.
//  Copyright (c) 2015 RuMe Academy. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var answerButtons: [UIButton]!
    
    @IBAction func answerButtonHandler(sender: UIButton) {

        if sender.titleLabel!.text == correctAnswer {
            nextQuestion()
            
            
        } else {
            sender.backgroundColor = UIColor.redColor()
            print("Wrong Answer")
        }
        
    
            }
    
    
    var correctAnswer: String?
    
    var answers = [String]()
    
    var image: String?
    
//    var questionIdx = 0
//    Int(arc4random_uniform(UInt32(array.count)))
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadQuizData()
        nextQuestion()
    }

    
    
    func nextQuestion() {
        
        let currentQuestion = imgArray![Int(arc4random_uniform(UInt32(imgArray!.count)))]
        
        
        answers = currentQuestion["Answers"] as! [String]
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        image = currentQuestion["Image"] as? String
        titlesForButtons()
    
        print(image)
        print(answers)
        print(correctAnswer)
    
    }
    
    func titlesForButtons() {
        for (idx,button) in answerButtons.enumerate() {
           
            button.setImage(UIImage(named: answers[idx]), forState: .Normal)
            button.enabled = true
            button.titleLabel!.lineBreakMode = .ByWordWrapping
            button.setTitle(answers[idx], forState: .Normal)
           
        }
        
        imageView.image = UIImage(named: image!)
    }

    func loadQuizData() {
        
        //Imgage Quiz Data
        let pathIMG = NSBundle.mainBundle().pathForResource("ImageQuiz", ofType: "plist")
        
        let dictIMG = NSDictionary(contentsOfFile: pathIMG!)
        
        imgArray = dictIMG!["Questions"]!.mutableCopy() as? Array
        
        check()
    }
    
    func check() {
//        print(imgArray)
    }

}
