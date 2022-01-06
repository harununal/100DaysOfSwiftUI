//
//  User+Friend.swift
//  Bamboo
//
//  Created by Mac on 6.01.2022.
//

import Foundation
import SwiftUI

struct User: Codable, Identifiable {
    var id: String
    var name: String
    var age: Int
    var company: String
    var email: String
    var address: String
    var about: String
    var tags: [String]
    var friends: [Friend]
    var isActive : Bool
    
    var numberFriends : String {
        String(friends.count)
    }
}

struct Friend: Codable, Identifiable {
    
    var name: String
    var id: String
    
}

