//
//  WinnerViewController.swift
//  CBS App
//
//  Created by William Judd on 11/15/15.
//  Copyright © 2015 William Judd. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         _ = NSTimer.scheduledTimerWithTimeInterval(8.0, target: self, selector: "timeToMoveOn", userInfo: nil, repeats: false)
        
        
        let score = NSUserDefaults.standardUserDefaults().integerForKey("score")
        print("Score: \(score)")
            
        
        if score < 5 {
            
            
            let stressBall = "stressBall"
            let image = UIImage(named: stressBall)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRectMake((view.bounds.width - 325) / 2, (view.bounds.height - 325) / 2 - 100, 325, 325)
            view.addSubview(imageView)
            
        }else{
            
            let powerBank = "powerBank"
            let image = UIImage(named: powerBank)
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRectMake((view.bounds.width - 520) / 2, (view.bounds.height - 180) / 2 - 100, 520, 180)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
