//
//  CachedFriend+CoreDataProperties.swift
//  Bamboo
//
//  Created by Mac on 7.01.2022.
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID
    @NSManaged public var name: String?
    
    var wrappedName: String {
        return name ?? "Unknown Name"
    }

}

extension CachedFriend : Identifiable {

}
