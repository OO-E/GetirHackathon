//
//  Color.swift
//  BirdHUD
//
//  Created by ozgun Mac on 21.05.2016.
//  Copyright © 2016 ooe. All rights reserved.
//

import UIKit

extension UIColor{
    class func HexColor(rgbValue: UInt,alpha:CGFloat) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
        
    }
}
