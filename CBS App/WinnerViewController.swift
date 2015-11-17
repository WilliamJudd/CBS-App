//
//  WinnerViewController.swift
//  CBS App
//
//  Created by William Judd on 11/15/15.
//  Copyright © 2015 William Judd. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {

    @IBOutlet var scoreLabel: UILabel!
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touchCount = touches.count
        
        if touchCount == 2 {
        
            timeToMoveOn()
            
        }else{
            
        }
    }

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
//         _ = NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
        
        
        let score = NSUserDefaults.standardUserDefaults().integerForKey("score")
        scoreLabel.text = "You got \(score) correct!"
        
        
        if score < 5 {
            
            
            let stressBall = "stressBall"
            let image = UIImage(named: stressBall)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 130, y: 254, width: 509, height: 458)
            view.addSubview(imageView)
            
        }else{
            
            let powerBank = "PowerBank3"
            let image = UIImage(named: powerBank)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 130, y: 292, width: 509, height: 332)
            view.addSubview(imageView)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeToMoveOn() {
        self.performSegueWithIdentifier("unwind", sender: self)
        
    }

   }
