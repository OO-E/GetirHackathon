//
//  Elements.swift
//  GetirHackathon
//
//  Created by Özgün on 5.03.2017.
//  Copyright © 2017 Özgün. All rights reserved.
//

import Foundation

enum ElementType : String{
    case circle = "circle"
    case rectangle = "rectangle"
    
}
class Elements{
    
    var code = Int()
    var inviteCode = String()
    var msg = String()
    var array_Element = [Element]()
}
//----------------------------------------------------------------------
class Element{

    var position = Position()
    var color = String()
    var type : ElementType!
    
}
//----------------------------------------------------------------------
class Circle:Element{

    var r = Int()
    
}
//----------------------------------------------------------------------
class Rectangle:Element{
    
    var width = Int()
    var height = Int()
    
}
//----------------------------------------------------------------------
class Position{
    var x = Int()
    var y = Int()
}

