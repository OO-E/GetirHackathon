//
//  ViewController.swift
//  GetirHackathon
//
//  Created by Özgün on 5.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.whiteColor()
        
        let param = ["email":"ergenozgun@gmail.com",
                     "name":"Orhan Özgün Ergen",
                     "gsm":"905364680029"
        ]
        RequestConnenction.sharedInstance().connectionPOST(Api.getElements, parameter: param, complateBlock: { (json) in
            
                print(json)
            
            }) { (error) in
                
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

