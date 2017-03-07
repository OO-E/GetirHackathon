//
//  ViewController.swift
//  GetirHackathon
//
//  Created by Özgün on 5.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import FlatColor
import TIHexColor

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.hexColor(0x212121)
        
        let param = ["email":"ergenozgun@gmail.com",
                     "name":"Orhan Özgün Ergen",
                     "gsm":"905364680029"
        ]
        RequestConnenction.sharedInstance().connectionPOST(Service.getElements, parameter: param, complateBlock: { (json) in
            
            print(json)
                ApiParse.parseElements(json, complate: { (obj) in
                    
                        self.drawElement(obj)
                
                    }, error: { (msg) in
                        print(msg)
                })
            
            }) { (error) in
                print("Servis Hatası")
        }
        
    }

    override func viewWillAppear(animated: Bool) {

        self.navigationController?.navigationBarHidden = true
        

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func drawElement(obj:Elements){
        
        for obj in obj.array_Element{
        
            if(obj.type == ElementType.circle){
                
                let circle = obj as! Circle
                
                let circlePath = UIBezierPath(arcCenter: CGPoint(x: circle.position.x,y: circle.position.y), radius: CGFloat(circle.r), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
                
                let shapeLayer = CAShapeLayer()
                shapeLayer.path = circlePath.CGPath
                shapeLayer.fillColor = UIColor.clearColor().CGColor
                shapeLayer.strokeColor = UIColor.colorWithHexString(circle.color, alpha: 1.0).CGColor
                shapeLayer.lineWidth = 3.0
                view.layer.addSublayer(shapeLayer)
            
            }else{
            
            let rectangle = obj as! Rectangle
                let vw_Rct = UIView()
                vw_Rct.frame = CGRect(x: rectangle.position.x, y: rectangle.position.y, width: rectangle.width, height: rectangle.height)
                vw_Rct.backgroundColor = UIColor.clearColor()
                vw_Rct.layer.borderWidth = 1
                vw_Rct.layer.borderColor = UIColor.colorWithHexString(rectangle.color, alpha: 1.0).CGColor
                
                
                self.view.addSubview(vw_Rct)
                
                
                
            }
        
        }
    }
    
    

}

