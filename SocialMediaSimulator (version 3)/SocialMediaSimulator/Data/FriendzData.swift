//
//  FriendzData.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation

struct FriendzData: Codable {
    
    var id: UUID
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var registered: Date
    var tags: [String]
    var friends: [Connection]
}
  
struct Connection: Codable {
    var id: UUID
    var name: String
}


                
