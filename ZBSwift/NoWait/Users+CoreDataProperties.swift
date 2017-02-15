//
//  Users+CoreDataProperties.swift
//  NoWait
//
//  Created by ZBin on 15/10/17.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Users {

    @NSManaged var codemind: String?
    @NSManaged var name: String?
    @NSManaged var password: String?
    @NSManaged var userID: NSNumber?

}
