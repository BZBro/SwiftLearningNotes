//
//  MTUser.m
//  Generate by ModelBot
//
//  Created by welsonla on 2016-01-26 23:24:51.
//  Copyright (c) 2016年 Autohome. All rights reserved.
//
import ObjectMapper

class MTUser: Mappable {
    var firstResult:Int?
    var userIntroduce:String?
    var userAge:Int?
    var userSex:Int?
    var depositMoney:Int?
    var Id:Int?
    var userPhoto:String?
    var userExperience:Int?
    var addrCode:Int?
    var businessLicense:Int?
    var queryDynamicConditions:[String:AnyObject]?
    var userIntegration:Int?
    var autoLogin:String?
    var userIdcard:String?
    var chatTime:String?
    var schoolTime:String?
    var userCredit:Int?
    var userHeight:String?
    var userWeight:String?
    var tel:String?
    var userPhone:String?
    var userBirthday:String?
    var role:Int?
    var userCode:String?
    var email:String?
    var chatContent:String?
    var fromMajor:String?
    var roleName:String?
    var userVerify:Int?
    var maxResults:Int?
    var realName:String?
    var count:Int?
    var infoComplete:Int?
    var userCoordinate:String?
    var sortedConditions:[String:AnyObject]?
    var sortColumnsString:String?
    var addrDetail:String?
    var fromSchool:String?
    var fromCollege:String?
    var userStandard:String?
    var openId:String?
    var topCount:String?
    var dynamicProperties:[String:AnyObject]?
    var finallyLoginDate:String?
    var success:String?
    var userName:String?
    var password:String?
    var sortColumns:String?
    var message:String?
    var cmd:String?
    
    
    required init?(_ map: Map) {
        
    }
    
    // Mappable
    func mapping(map: Map) {
        firstResult <- map["firstResult"]
        userIntroduce <- map["userIntroduce"]
        userAge <- map["userAge"]
        userSex <- map["userSex"]
        depositMoney <- map["depositMoney"]
        Id <- map["Id"]
        userPhoto <- map["userPhoto"]
        userExperience <- map["userExperience"]
        addrCode <- map["addrCode"]
        businessLicense <- map["businessLicense"]
        queryDynamicConditions <- map["queryDynamicConditions"]
        userIntegration <- map["userIntegration"]
        autoLogin <- map["autoLogin"]
        userIdcard <- map["userIdcard"]
        chatTime <- map["chatTime"]
        schoolTime <- map["schoolTime"]
        userCredit <- map["userCredit"]
        userHeight <- map["userHeight"]
        userWeight <- map["userWeight"]
        tel <- map["tel"]
        userPhone <- map["userPhone"]
        userBirthday <- map["userBirthday"]
        role <- map["role"]
        userCode <- map["userCode"]
        email <- map["email"]
        chatContent <- map["chatContent"]
        fromMajor <- map["fromMajor"]
        roleName <- map["roleName"]
        userVerify <- map["userVerify"]
        maxResults <- map["maxResults"]
        realName <- map["realName"]
        count <- map["count"]
        infoComplete <- map["infoComplete"]
        userCoordinate <- map["userCoordinate"]
        sortedConditions <- map["sortedConditions"]
        sortColumnsString <- map["sortColumnsString"]
        addrDetail <- map["addrDetail"]
        fromSchool <- map["fromSchool"]
        fromCollege <- map["fromCollege"]
        userStandard <- map["userStandard"]
        openId <- map["openId"]
        topCount <- map["topCount"]
        dynamicProperties <- map["dynamicProperties"]
        finallyLoginDate <- map["finallyLoginDate"]
        success <- map["success"]
        userName <- map["userName"]
        password <- map["password"]
        sortColumns <- map["sortColumns"]
        message <- map["message"]
        cmd <- map["cmd"]
        
    }
    
    /*
    //NSCoding
    required init?(coder aDecoder: NSCoder) {
        super.init()
        
        firstResult = aDecoder.decodeIntegerForKey("firstResult")
        userIntroduce = aDecoder.decodeObjectForKey("userIntroduce") as? String
        userAge = aDecoder.decodeIntegerForKey("userAge")
        userSex = aDecoder.decodeIntegerForKey("userSex")
        depositMoney = aDecoder.decodeIntegerForKey("depositMoney")
        Id = aDecoder.decodeIntegerForKey("Id")
        userPhoto = aDecoder.decodeObjectForKey("userPhoto") as? String
        userExperience = aDecoder.decodeIntegerForKey("userExperience")
        addrCode = aDecoder.decodeIntegerForKey("addrCode")
        businessLicense = aDecoder.decodeIntegerForKey("businessLicense")
//        queryDynamicConditions
        userIntegration = aDecoder.decodeIntegerForKey("userIntegration")
//        autoLogin
        userIdcard = aDecoder.decodeObjectForKey("userIdcard") as? String
        chatTime = aDecoder.decodeObjectForKey("chatTime") as? String
        schoolTime = aDecoder.decodeObjectForKey("schoolTime") as? String
        userCredit = aDecoder.decodeIntegerForKey("userCredit")
        userHeight = aDecoder.decodeObjectForKey("userHeight") as? String
        userWeight = aDecoder.decodeObjectForKey("userWeight") as? String
        tel = aDecoder.decodeObjectForKey("tel") as? String
        userPhoto = aDecoder.decodeObjectForKey("userPhoto") as? String
        userBirthday = aDecoder.decodeObjectForKey("userBirthday") as? String
        role = aDecoder.decodeIntegerForKey("role")
        userCode = aDecoder.decodeObjectForKey("userCode") as? String
        email = aDecoder.decodeObjectForKey("email") as? String
        chatContent = aDecoder.decodeObjectForKey("chatContent") as? String
        message = (aDecoder.decodeObjectForKey("message") as! String)
        fromMajor = aDecoder.decodeObjectForKey("fromMajor") as? String
        roleName = aDecoder.decodeObjectForKey("roleName") as? String
        cmd = aDecoder.decodeObjectForKey("cmd") as? String
        userVerify = aDecoder.decodeIntegerForKey("userVerify")
//        password = aDecoder.decodeObjectForKey("password") as? String
        maxResults = aDecoder.decodeIntegerForKey("maxResults")
        realName = aDecoder.decodeObjectForKey("realName") as? String
        count = aDecoder.decodeIntegerForKey("count")
        infoComplete = aDecoder.decodeIntegerForKey("infoComplete")
        userCoordinate = aDecoder.decodeObjectForKey("userCoordinate") as? String
//        sortedConditions
//        sortColumnsString
        addrDetail = aDecoder.decodeObjectForKey("addrDetail") as? String
        fromSchool = aDecoder.decodeObjectForKey("fromSchool")  as? String
        fromCollege = aDecoder.decodeObjectForKey("fromCollege") as? String
        userStandard = aDecoder.decodeObjectForKey("userStandard") as? String
        openId = aDecoder.decodeObjectForKey("openId") as? String
        topCount = aDecoder.decodeObjectForKey("topCount") as? String
//        dynamicProperties
//        finallyLoginDate
        success = aDecoder.decodeObjectForKey("success") as? String
        userName = aDecoder.decodeObjectForKey("userName") as? String
//        sortColumns
//        cmd
    }
    
    required func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeInteger(firstResult!, forKey:"firstResult")
        aCoder.encodeObject(userIntroduce!, forKey:"userIntroduce")
        aCoder.encodeInteger(userAge!, forKey:"userAge")
        aCoder.encodeInteger("userSex")
        aCoder.encodeInteger("depositMoney")
        aCoder.encodeInteger("Id")
        aCoder.encodeObject("userPhoto")
        aCoder.encodeInteger("userExperience")
        aCoder.encodeInteger("addrCode")
        aCoder.encodeInteger("businessLicense")
        aCoder.encodeInteger("userIntegration")
        aCoder.encodeObject("userIdcard")
        aCoder.encodeObject("chatTime")
        aCoder.encodeObject("schoolTime")
        aCoder.encodeInteger("userCredit")
        aCoder.encodeObject("userHeight")
        aCoder.encodeObject("userWeight")
        aCoder.encodeObject("tel")
        aCoder.encodeObject("userPhoto")
        aCoder.encodeObject("userBirthday")
        aCoder.encodeInteger("role")
        aCoder.encodeObject("userCode")
        aCoder.encodeObject("email")
        aCoder.encodeObject("chatContent")
        aCoder.encodeObject("message") as!
            aCoder.encodeObject("fromMajor")
        aCoder.encodeObject("roleName")
        aCoder.encodeObject("cmd")
        aCoder.encodeInteger("userVerify")
        aCoder.encodeInteger("maxResults")
        aCoder.encodeObject("realName")
        aCoder.encodeInteger("count")
        aCoder.encodeInteger("infoComplete")
        aCoder.encodeObject("userCoordinate")
        aCoder.encodeObject("addrDetail")
        aCoder.encodeObject("fromSchool")
        aCoder.encodeObject("fromCollege")
        aCoder.encodeObject("userStandard")
        aCoder.encodeObject("openId")
        aCoder.encodeObject("topCount")
        aCoder.encodeObject("success")
        aCoder.encodeObject("userName")aCoder.encodeInteger("firstResult")
        aCoder.encodeObject("userIntroduce")
        aCoder.encodeInteger("userAge")
        aCoder.encodeInteger("userSex")
        aCoder.encodeInteger("depositMoney")
        aCoder.encodeInteger("Id")
        aCoder.encodeObject("userPhoto")
        aCoder.encodeInteger("userExperience")
        aCoder.encodeInteger("addrCode")
        aCoder.encodeInteger("businessLicense")
        aCoder.encodeInteger("userIntegration")
        aCoder.encodeObject("userIdcard")
        aCoder.encodeObject("chatTime")
        aCoder.encodeObject("schoolTime")
        aCoder.encodeInteger("userCredit")
        aCoder.encodeObject("userHeight")
        aCoder.encodeObject("userWeight")
        aCoder.encodeObject("tel")
        aCoder.encodeObject("userPhoto")
        aCoder.encodeObject("userBirthday")
        aCoder.encodeInteger("role")
        aCoder.encodeObject("userCode")
        aCoder.encodeObject("email")
        aCoder.encodeObject("chatContent")
        aCoder.encodeObject("message") as!
        aCoder.encodeObject("fromMajor")
        aCoder.encodeObject("roleName")
        aCoder.encodeObject("cmd")
        aCoder.encodeInteger("userVerify")
        aCoder.encodeInteger("maxResults")
        aCoder.encodeObject("realName")
        aCoder.encodeInteger("count")
        aCoder.encodeInteger("infoComplete")
        aCoder.encodeObject("userCoordinate")
        aCoder.encodeObject("addrDetail")
        aCoder.encodeObject("fromSchool")
        aCoder.encodeObject("fromCollege")
        aCoder.encodeObject("userStandard")
        aCoder.encodeObject("openId")
        aCoder.encodeObject("topCount")
        aCoder.encodeObject("success")
        aCoder.encodeObject("userName")
    }
 */
}
