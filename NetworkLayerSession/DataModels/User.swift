//
//  User.swift
//  NetworkLayerURLSession
//
//  Created by Anoop Rawat on 26/02/17.
//  Copyright © 2017 Anoop Rawat. All rights reserved.
//

import UIKit

class User {
    
    public var id : Int?
    public var name : String?
    public var username : String?
    public var email : String?
    public var address : [String:Any]?
    public var phone : String?
    public var website : String?
    public var company : [String:String]?
    
    
    required init(data:[String:Any]){
       self.id  = data["id"] as? Int
       self.name = data["name"] as? String
       self.username = data ["username"] as? String
       self.email = data ["email"] as? String
       self.address = data ["address"] as? [String:Any]
       self.phone = data ["phone"] as? String
       self.website = data ["website"] as? String
       self.company = data ["address"] as? [String:String]
    }

}
