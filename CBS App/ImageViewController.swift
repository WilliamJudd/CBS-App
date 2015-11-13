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
    
    var correctAnswer: String?
    
    var answers = [String]()
    
    var image: String?
    
    var questionIdx = 0
    
    var currentScore = 0
    
    var progress: KDCircularProgress!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuizData()
        imgArray!.shuffle()
        nextQuestion()
        
        progress = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progress.startAngle = -90
        progress.progressThickness = 0.2
        progress.trackThickness = 0.6
        progress.clockwise = true
        progress.gradientRotateSpeed = 2
        progress.roundedCorners = false
        progress.glowMode = .Forward
        progress.glowAmount = 0.9
        progress.setColors(UIColor.cyanColor())
        progress.center = CGPoint(x: view.center.x, y: view.center.y + 25)
        view.addSubview(progress)
        
        progress.animateFromAngle(0, toAngle: 360, duration: 15) { completed in
            if completed {
                
                                self.nextQuestion()
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
        
        
        
    }

    @IBAction func answerButtonHandler(sender: UIButton) {
        startTimer()

        if sender.titleLabel!.text == correctAnswer {
            print("correct")
            questionIdx++
            currentScore++
        } else {
            
            print("wrong")
            questionIdx++
            
        }
        
        if questionIdx == 6 {
            
            performSegueWithIdentifier("done", sender: nil)
            
            
        }else{
            
        }
        nextQuestion()
//        print(questionIdx)
//        print(currentScore)
        
    }
    
    func nextQuestion() {
        
        let currentQuestion = imgArray![questionIdx]
        
        answers = currentQuestion["Answers"] as! [String]
        correctAnswer = currentQuestion["CorrectAnswer"] as? String
        image = currentQuestion["Image"] as? String
        
        titlesForButtons()
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
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
                if segue.identifier == "done" {
                    NSUserDefaults.standardUserDefaults().setInteger(currentScore, forKey: "score")
       

        }
}
    
  
    
    func startTimer(){
        
    
        
    }

    
}
