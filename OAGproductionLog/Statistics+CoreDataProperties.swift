//
//  Statistics+CoreDataProperties.swift
//  OAGproductionLog
//
//  Created by Sergio Nunez on 6/30/19.
//  Copyright © 2019 Sergio Nunez. All rights reserved.
//
//

import Foundation
import CoreData


extension Statistics {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Statistics> {
        return NSFetchRequest<Statistics>(entityName: "Statistics")
    }

    @NSManaged public var done: Int16
    @NSManaged public var goal: Int16
    @NSManaged public var results: Int16
    @NSManaged public var day: String?

}
