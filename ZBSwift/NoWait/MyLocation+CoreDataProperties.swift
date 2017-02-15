//
//  MyLocation+CoreDataProperties.swift
//  NoWait
//
//  Created by ZBin on 15/10/7.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension MyLocation {

    @NSManaged var category: String?
    @NSManaged var currentLocation: NSObject?
    @NSManaged var date: NSDate?
    @NSManaged var locationDescription: String?
    @NSManaged var myID: NSNumber?
    @NSManaged var photoID: NSNumber?
    @NSManaged var placemark: NSObject?

}
