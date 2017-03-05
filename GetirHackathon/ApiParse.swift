//
//  ApiParse.swift
//  GetirHackathon
//
//  Created by Özgün on 5.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//


import SwiftyJSON


class ApiParse {
    
    class func parseElements(json:JSON ,complate:(obj : Elements)->(),error:(msg:String)->()){
        
        if(json["msg"].string! == "Success"){
            
            if(json["elements"].count >= 1 ){
                
                let obj = Elements()
                
                for index in 0..<json["elements"].count{
                    
                    if(json["elements"][index]["type"].string! == ElementType.circle.rawValue){
                        
                        let crc = Circle()
                        crc.color           = json["elements"][index]["color"].string!
                        crc.r               = json["elements"][index]["r"].int!
                        crc.position.x      = json["elements"][index]["xPosition"].int!
                        crc.position.y      = json["elements"][index]["yPosition"].int!
                        crc.type            = ElementType.circle
                        
                        obj.array_Element.append(crc)
                        
                    }
                    
                    
                    if(json["elements"][index]["type"].string! == ElementType.rectangle.rawValue){
                        
                        let rct = Rectangle()
                        rct.height = json["elements"][index]["height"].int!
                        rct.width = json["elements"][index]["width"].int!
                        rct.color = json["elements"][index]["color"].string!
                        rct.position.x = json["elements"][index]["xPosition"].int!
                        rct.position.y = json["elements"][index]["yPosition"].int!
                        
                        obj.array_Element.append(rct)
                        
                    }
                    
                }
                complate(obj:obj)
                
            }else{
                
                //elements array boş geldi ?
                error(msg:"Liste Boş Geldi")
                
            }
            
        }else{
            
            error(msg:"Işlem Başarılı Olmadı")
        }
        
    }
    
    
}