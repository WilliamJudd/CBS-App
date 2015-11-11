//
//  MatchScreen.swift
//  CBS App
//
//  Created by William Judd on 11/7/15.
//  Copyright © 2015 William Judd. All rights reserved.
//

import UIKit

class MatchScreen: UIViewController {

    
    var actorImages: [UIImage] = [
        UIImage(named: "logo1.png")!,
        UIImage(named: "logo2.png")!
    ]
    
    
    var buttonImages: [UIImage] = [
        UIImage(named: "logo1.png")!,
        UIImage(named: "logo2.png")!
    ]
    
    func newActor() {
        
        
        let image = UIImage(named: "act0")
        let imageView = UIImageView(image: image)
        imageView.frame = CGRect(x: 178, y: 146, width: 412, height: 383)
        view.addSubview(imageView)
        
        
        
    }
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
newActor()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
