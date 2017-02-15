//
//  FindClubApplyResponse.swift
//  ShengJianBao
//
//  Created by ZBin on 16/4/10.
//  Copyright © 2016年 hyz. All rights reserved.


import UIKit
import SwiftyJSON
import ObjectMapper

class FindClubApplyResponse: Mappable {
    var totalRecord:Int?
    var data:[MTClubApply]?
    var datamap:String?
    
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        totalRecord <- map["totalRecord"]
        data <- map["data"]
        datamap <- map["map"]
    }
}


//class FindIndexApplyRespone: Mappable {
//    internal var totalRecord: Int?
//
//    internal init(json: JSON){
//        totalRecord = json["totalRecord"].int
//    }
//    convenience internal init(object: AnyObject) {
//        self.init(json: JSON(object))
//    }
//    required init?(_ map: Map){
//
//    }
//    func mapping(map: Map) {
//        totalRecord <- map["totalRecord"]
//    }
//}

