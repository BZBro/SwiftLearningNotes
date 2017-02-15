//
//  MyDaily+CoreDataProperties.swift
//  NoWait
//
//  Created by ZBin on 15/11/7.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MyDaily {

    @NSManaged var myColorA: NSNumber?
    @NSManaged var myColorB: NSNumber?
    @NSManaged var myColorG: NSNumber?
    @NSManaged var myColorR: NSNumber?
    @NSManaged var myDaily: String?
    @NSManaged var myDate: String?
    @NSManaged var myFontSize: NSNumber?
    @NSManaged var myID: NSNumber?
    @NSManaged var photoID: NSNumber?
    @NSManaged var month: String?

}
