//
//  MyDaily.swift
//  NoWait
//
//  Created by ZBin on 15/10/17.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import Foundation
import CoreData

class MyDaily: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    var hasPhoto: Bool {
         return photoID != nil
    }
    
    var photoPath: String {
        assert(photoID != nil, "没有图片")       
        let fileName = "/Documents\(photoID!).png"
        return applicationDocumentPath.stringByAppendingString(fileName)
    }
    var photoImage: UIImage? {
        return UIImage(contentsOfFile: photoPath)
    }
    var tempImage: UIImage?{
        return UIImage(named: "\(arc4random_uniform(16) + 1).jpg")
    }
    class func nextPhotoID() ->Int {
        let userDefault = NSUserDefaults.standardUserDefaults()
        let currentID = userDefault.integerForKey("PhotoID")
        userDefault.setInteger(currentID + 1, forKey: "PhotoID")
        return currentID
    }

}
