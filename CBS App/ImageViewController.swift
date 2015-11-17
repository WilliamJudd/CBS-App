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
    
    @IBOutlet var progress: KDCircularProgress!
//    var progress: KDCircularProgress!
    var alertView: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadQuizData()
          imgArray!.shuffle()
        // Creating the first question
        nextQuestion()
        
        // Picks the first question at random.
      
        
        
        
//        createTimer()
        gameRulesAlert()
        
    }
    
    @IBAction func answerButtonHandler(sender: UIButton) {
        
        
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
    
   
    
    
    
    func startTimer(){
        
        
        progress.animateFromAngle(0, toAngle: 360, duration: 60) { completed in
           
            if completed {
                
                print("animation stopped, completed")
            } else {
                
                print("animation stopped, was interrupted")
            }
           
            // This is where the completion is being called, have no clue why.
            
            self.timesUpAlert()
        }
        
        
    }
    
    func gameRulesAlert() {
        
        alertView = UIView(frame: view.bounds)
        alertView.backgroundColor = UIColor.clearColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.shadowOffset = CGSizeMake(0, 5);
        alertView.layer.shadowOpacity = 0.3;
        alertView.layer.shadowRadius = 10.0;
        alertView.tag = 1
        
        let alert = UIImage(named: "Congratulations") as UIImage!
        let imageView = UIImageView(image: alert)
        imageView.frame = CGRectMake((view.bounds.width - 506) / 2, (view.bounds.height - 353) / 2 - 30, 506, 353)
        imageView.alpha = 0.0
        
        // Ok Button
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.setTitle("OK!", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.backgroundColor = UIColor(red: 0.29, green: 0.71, blue: 0.97, alpha: 1)
        button.frame = CGRectMake((view.bounds.width - 350)/2 , (view.bounds.height - 65)/2 + 90, 350, 65)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: Selector("dismissA"), forControlEvents: UIControlEvents.TouchUpInside)
        button.bringSubviewToFront(button)
        
        view.addSubview(alertView)
        alertView.addSubview(imageView)
        alertView.insertSubview(button, aboveSubview: imageView)
        
        UIView.animateWithDuration(0.7) {
            self.alertView.alpha = 1.0
            imageView.alpha = 1.0
            
        }
        
    }
    
    func dismissA () {
        
        if let viewWithTag = self.view.viewWithTag(1) {
            viewWithTag.removeFromSuperview()
                startTimer()
            
        }else{
            
        }
    }
    
    func timesUpAlert() {
        
        alertView = UIView(frame: view.bounds)
        alertView.backgroundColor = UIColor.clearColor()
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.blackColor().CGColor;
        alertView.layer.shadowOffset = CGSizeMake(0, 5);
        alertView.layer.shadowOpacity = 0.3;
        alertView.layer.shadowRadius = 10.0;
        alertView.tag = 1
        
        let alert = UIImage(named: "cbsAlert2") as UIImage!
        let imageView = UIImageView(image: alert)
        imageView.frame = CGRectMake((view.bounds.width - 506) / 2, (view.bounds.height - 319) / 2 - 30, 506, 319)
        imageView.alpha = 0.0
        
        // Ok Button
        let button = UIButton(type: UIButtonType.System) as UIButton
        button.setTitle("OK!", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 20)
        button.backgroundColor = UIColor(red: 0.29, green: 0.71, blue: 0.97, alpha: 1)
        button.frame = CGRectMake((view.bounds.width - 350)/2 , (view.bounds.height - 65)/2 + 70, 350, 65)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: Selector("nextScreen"), forControlEvents: UIControlEvents.TouchUpInside)
        button.bringSubviewToFront(button)
        
        view.addSubview(alertView)
        alertView.addSubview(imageView)
        alertView.insertSubview(button, aboveSubview: imageView)
        
        UIView.animateWithDuration(0.7) {
            self.alertView.alpha = 1.0
            imageView.alpha = 1.0
            
        }
        
    }
    
    
    func nextScreen(){
        performSegueWithIdentifier("done", sender: nil)

    
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "done" {
            NSUserDefaults.standardUserDefaults().setInteger(currentScore, forKey: "score")
            
            
        }
    }
}