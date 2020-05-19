//
//  Range+CoreDataProperties.swift
//  Stamurai
//
//  Created by Pavan Kalyan Jonnadula on 19/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//
//

import Foundation
import CoreData


extension Range {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Range> {
        return NSFetchRequest<Range>(entityName: "Range")
    }

    @NSManaged public var date: String?
    @NSManaged public var maxrange: Int16
    @NSManaged public var minrange: Int16

}
