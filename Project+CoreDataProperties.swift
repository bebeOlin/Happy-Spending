//
//  Project+CoreDataProperties.swift
//  Happy Spending
//
//  Created by Bruce Bolin on 11/22/21.
//
//

import Foundation
import CoreData


extension Project {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Project> {
        return NSFetchRequest<Project>(entityName: "Project")
    }

    @NSManaged public var eighthBasePic: String?
    @NSManaged public var eighthBaseValue: Int64
    @NSManaged public var eighthURL: String?
    @NSManaged public var eighthURLTitle: String?
    @NSManaged public var fifthBasePic: String?
    @NSManaged public var fifthBaseValue: Int64
    @NSManaged public var fifthURL: String?
    @NSManaged public var fifthURLTitle: String?
    @NSManaged public var firstBasePic: String?
    @NSManaged public var firstBaseValue: Int64
    @NSManaged public var firstURL: String?
    @NSManaged public var firstURLTitle: String?
    @NSManaged public var fourthBasePic: String?
    @NSManaged public var fourthBaseValue: Int64
    @NSManaged public var fourthURL: String?
    @NSManaged public var fourthURLTitle: String?
    @NSManaged public var homeBasePic: String?
    @NSManaged public var homeBaseValue: Int64
    @NSManaged public var homeURL: String?
    @NSManaged public var homeURLTitle: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var ninthBasePic: String?
    @NSManaged public var ninthBaseValue: Int64
    @NSManaged public var ninthURL: String?
    @NSManaged public var ninthURLTitle: String?
    @NSManaged public var peoplePic: String?
    @NSManaged public var projectValue: Int64
    @NSManaged public var secondBasePic: String?
    @NSManaged public var secondBaseValue: Int64
    @NSManaged public var secondURL: String?
    @NSManaged public var secondURLTitle: String?
    @NSManaged public var seventhBasePic: String?
    @NSManaged public var seventhBaseValue: Int64
    @NSManaged public var seventhURL: String?
    @NSManaged public var seventhURLTitle: String?
    @NSManaged public var sixthBasePic: String?
    @NSManaged public var sixthBaseValue: Int64
    @NSManaged public var sixthURL: String?
    @NSManaged public var sixthURLTitle: String?
    @NSManaged public var thirdBasePic: String?
    @NSManaged public var thirdBaseValue: Int64
    @NSManaged public var thirdURL: String?
    @NSManaged public var thirdURLTitle: String?
    @NSManaged public var projectTitle: String?

}

extension Project : Identifiable {

}
