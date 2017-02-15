//
//  MTClubApply.swift
//  ShengJianBao
//
//  Created by ZBin on 16/4/10.
//  Copyright © 2016年 hyz. All rights reserved.
//

import ObjectMapper

class MTClubApply: Mappable {
    var logo:String?
    var userName:String?
    var fromSchool:String?
    var dateAdd:String?
    var articleContent:String?
    var articlePicture:String?
    var praiseUsers:String?
    //话题编号
    var code:String?
    var praiseNum:Int?
    var shareNum:Int?
    var evaluateNum:Int?
    var sex:Int?
    
    required init?(_ map: Map) {
        //mapping(map)
    }
    
    //
    func mapping(map: Map) {
        logo <- map[""]
        userName <- map["userName"]
        fromSchool <- map["fromSchool"]
        dateAdd <- map["dateAdd"]
        articleContent <- map["articleContent"]
        articlePicture <- map["articlePicture"]
        praiseUsers  <- map["praiseUsers"]
        code <- map["code"]
        praiseNum <- map["praiseNum"]
        shareNum <- map["shareNum"]
        evaluateNum <- map["evaluateNum"]
        sex <- map["sex"]
        
    }
}