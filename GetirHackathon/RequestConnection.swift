//
//  RequestConnection.swift
//  GetirHackathon
//
//  Created by Özgün on 5.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


enum Service : String {
    case getElements = "getElements"

}


class RequestConnenction {
    
    private var serviceURL = String()
    
    
    class func sharedInstance()->RequestConnenction{
        let rc = RequestConnenction()
        
        rc.serviceURL = "https://getir-bitaksi-hackathon.herokuapp.com/"
        
        
        
        return rc
    }
    
    func connectionPOST(service:Service,parameter:NSDictionary,complateBlock:(json:JSON)->(),errorBlock:(error:NSError)->()){
        
        let urlStr = String(format:"%@%@", self.serviceURL , service.rawValue)
        let URL = NSURL(string:String(urlStr))!
        
        
        
        Alamofire.request(.POST, URL, parameters: parameter as? [String : AnyObject],encoding: .JSON).responseJSON { (response) -> Void in
            
            print("        -    Request POST    -           ")
            print("RC POST URL  = \(URL)")
            print("RC POST isFailer \(response.result.isFailure)")
            print("RC POST isSucces \(response.result.isSuccess)")
            print("        ----------------------           ")

            if(response.result.value != nil && response.response != nil)
            {
                
                if(response.response?.statusCode == 200)
                {//Server Success response Data
                    complateBlock(json: JSON(response.result.value!))
                }else
                {//Error Operation
                    errorBlock(error: response.result.error!)
                }
                
            }else
            {//Error Operation
                errorBlock(error: response.result.error!)
            }
            
        }
        
        
        
        
        
        
    }
}

