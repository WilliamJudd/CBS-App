//
//  HomeScreen.swift
//  CBS App
//
//  Created by William Judd on 11/7/15.
//  Copyright © 2015 William Judd. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
      
        self.performSegueWithIdentifier("sign", sender: self)

    
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    @IBAction func unwindToContainerVC(segue: UIStoryboardSegue) {
        
    }
}
