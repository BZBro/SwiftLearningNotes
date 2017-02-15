//
//  GetUserMessageListIndex.swift
//  ShengJianBao
//
//  Created by Mike on 16/3/27.
//  Copyright © 2016年 hyz. All rights reserved.
//

import SwiftyJSON
import ObjectMapper

class GetUserMessageListIndex: Mappable {
    var data:[MTUserMessage]?
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
        data <- map["data"]
    }
}

class MTUserMessage: Mappable {
    var messageContent:String?
    var messageTitle:String?
    var messageType:Int?
    var dateAdd:String?
    
    required init?(_ map: Map) {
        
    }
    func mapping(map: Map) {
        messageContent <- map["messageContent"]
        messageTitle <- map["messageTitle"]
        messageType <- map["messageType"]
        dateAdd <- map["dateAdd"]
    }
}
