//  Created by ooe
//  Copyright © 2016 ozgun Mac. All rights reserved.
//

import UIKit


public class BirdHUD:UIView{
    //:MARK:- Variable
    var str_Title :String = "Waiting Please.."{
        didSet{
            self.lbl_Bottom.text = str_Title
        }
    }
    
    var color_BackGround:UIColor = UIColor.HexColor(0x000000, alpha: 0.8){
        didSet{
            self.backgroundColor = color_BackGround
        }
        
    }
    
    private var lbl_Bottom = UILabel()
    private let lyr_Cycle: CAShapeLayer = CAShapeLayer()

    //:MARK:- Constructor
    public init() {
        super.init(frame:UIScreen.mainScreen().bounds)
        self.backgroundColor = self.color_BackGround
        createUI()
        
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //:MARK:-  Create All Object
    private func createUI(){
        
        lyr_Cycle.lineCap = "round"
        lyr_Cycle.lineJoin = "round"
        lyr_Cycle.lineWidth = 4.0
        lyr_Cycle.fillColor = UIColor.clearColor().CGColor
        lyr_Cycle.strokeColor = UIColor.whiteColor().CGColor
        lyr_Cycle.strokeEnd = 0
        lyr_Cycle.frame = CGRect(x: self.frame.width/2-25, y: self.frame.height/2-25, width: 50, height: 50)
        self.layer.addSublayer(lyr_Cycle)
        
        lyr_Cycle.frame = CGRect(x: self.frame.width/2-25, y: self.frame.height/2, width: 50, height: 50)
        lyr_Cycle.path = UIBezierPath(ovalInRect:CGRect(x: 0 ,y: 0, width: 50, height: 50)).CGPath

        // Label Object
        lbl_Bottom.frame = CGRect(x: 0, y: self.frame.height-44, width: self.frame.width, height: 24)
        lbl_Bottom.textColor = UIColor.whiteColor()
        lbl_Bottom.textAlignment = NSTextAlignment.Center
        lbl_Bottom.text = str_Title
        self.addSubview(lbl_Bottom)
        
        
    }
    
    //:MARK:- Start Animation Function
   public func startAnimation(target:UIViewController){
        
        UIApplication.sharedApplication().keyWindow?.addSubview(self)
        
        let strokeStartAnimation = CABasicAnimation(keyPath: "strokeStart")
        strokeStartAnimation.fromValue = -1
        strokeStartAnimation.toValue = 1.0
        
        let strokeEndAnimation = CABasicAnimation(keyPath: "strokeEnd")
        strokeEndAnimation.fromValue = 0
        strokeEndAnimation.toValue = 1.0
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2.0
        animationGroup.repeatCount = Float.infinity
        animationGroup.animations = [strokeStartAnimation, strokeEndAnimation]
        lyr_Cycle.addAnimation(animationGroup, forKey: "animationGroup")
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0
        rotateAnimation.toValue = M_PI * 2
        rotateAnimation.repeatCount = Float.infinity
        rotateAnimation.duration = 2
        lyr_Cycle.addAnimation(rotateAnimation, forKey: "rotateAnimation")
        
        
    }
    
    //:MARK:- Change Text Function
   public func changeText(message:String){
        self.str_Title = message
    }
    
    //:MARK:- Stop Animation Functions
   public func stopAnimation(){
        //Stop All Animation And Remove View with animation
        
        UIView.animateWithDuration(0.5, animations: {
            self.alpha = 0
            
        }) { (xx) in
            
            self.lyr_Cycle.removeAllAnimations()
            self.removeFromSuperview()
            self.alpha = 1
            
        }
        
        
    }
    
   public func stopAnimation(str_Title:String,delay:Double){
        //Stop Animation And Write Last Message And Remove View With Animation
        
        self.lbl_Bottom.text = str_Title
        UIView.animateWithDuration(delay + 0.7, delay: delay, options: [.TransitionCrossDissolve], animations: {
            self.alpha = 0
            
        }) { (xx) in
            self.lyr_Cycle.removeAllAnimations()
            self.removeFromSuperview()
            self.alpha = 1
        }
        
        
        
        
    }
    
    
  
    
    
    
    
}
