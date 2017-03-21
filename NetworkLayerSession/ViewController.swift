//
//  ViewController.swift
//  NetworkLayerSession
//
//  Created by Anoop Rawat on 26/02/17.
//  Copyright © 2017 Anoop Rawat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // Created a Api Manager instance relate to User
    let userService = UserApiManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Calling rest webservice here
        userService.callingUserService(urlString: "users/1", parameter: nil)
        { (isSuccess, user, errorString) in
            if isSuccess {
                // This call back in main queue
                /// You get the user message here
            }
            else
            {
                // Log error here or you can show alert
            }
        }
        
        
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}




