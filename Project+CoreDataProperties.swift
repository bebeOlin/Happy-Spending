//
//  Project+CoreDataProperties.swift
//  Happy Spending
//
//  Created by Bruce Bolin on 10/1/21.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var firstBasePic: String?
    @NSManaged public var firstBaseValue: Int64
    @NSManaged public var firstURL: String?
    @NSManaged public var firstURLTitle: String?
    @NSManaged public var homeBasePic: String?
    @NSManaged public var homeBaseValue: Int64
    @NSManaged public var homeURL: String?
    @NSManaged public var homeURLTitle: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var peoplePic: String?
    @NSManaged public var projectValue: Int64
    @NSManaged public var secondBasePic: String?
    @NSManaged public var secondBaseValue: Int64
    @NSManaged public var secondURL: String?
    @NSManaged public var secondURLTitle: String?
    @NSManaged public var thirdBasePic: String?
    @NSManaged public var thirdBaseValue: Int64
    @NSManaged public var thirdURL: String?
    @NSManaged public var thirdURLTitle: String?

}

extension Project : Identifiable {

}
