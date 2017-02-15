//
//  MTBusinessInfo.m
//  Generate by ModelBot
//
//  Created by welsonla on 2016-03-30 22:18:30.
//  Copyright (c) 2016年 Timebot. All rights reserved.
//
import ObjectMapper

class MTBusinessInfo: Mappable {
	var Id:Int?
	var addrCode:Int?
	var userCode:String?
	var message:String?
	var fromMajor:String?
	var cmd:String?
	var userVerify:Int?
	var password:String?
	var maxResults:Int?
	var topCount:String?
	var count:Int?
	var realName:String?
	var infoComplete:Int?
	var userIntroduce:String?
	var userBirthday:String?
	var depositMoney:Int?
	var openId:String?
	var success:String?
	var addrDetail:String?
	var roleName:String?
	var schoolTime:String?
	var businessLicense:Int?
	var role:Int?
	var sortColumnsString:String?
	var queryDynamicConditions:[String:AnyObject]?
	var userSex:Int?
	var sortedConditions:[String:AnyObject]?
	var fromCollege:String?
	var firstResult:Int?
	var email:String?
	var userHeight:String?
	var fromSchool:String?
	var userCoordinate:String?
	var chatTime:String?
	var userExperience:Int?
	var userAge:Int?
	var userStandard:String?
	var userName:String?
	var userPhone:String?
	var userIdcard:String?
	var userCredit:Int?
	var userIntegration:Int?
	var tel:String?
	var sortColumns:String?
	var chatContent:String?
	var userPhoto:String?
	var finallyLoginDate:String?
	var autoLogin:String?
	var dynamicProperties:[String:AnyObject]?
	var userWeight:String?


    required init?(_ map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
		Id <- map["Id"]
		addrCode <- map["addrCode"]
		userCode <- map["userCode"]
		message <- map["message"]
		fromMajor <- map["fromMajor"]
		cmd <- map["cmd"]
		userVerify <- map["userVerify"]
		password <- map["password"]
		maxResults <- map["maxResults"]
		topCount <- map["topCount"]
		count <- map["count"]
		realName <- map["realName"]
		infoComplete <- map["infoComplete"]
		userIntroduce <- map["userIntroduce"]
		userBirthday <- map["userBirthday"]
		depositMoney <- map["depositMoney"]
		openId <- map["openId"]
		success <- map["success"]
		addrDetail <- map["addrDetail"]
		roleName <- map["roleName"]
		schoolTime <- map["schoolTime"]
		businessLicense <- map["businessLicense"]
		role <- map["role"]
		sortColumnsString <- map["sortColumnsString"]
		queryDynamicConditions <- map["queryDynamicConditions"]
		userSex <- map["userSex"]
		sortedConditions <- map["sortedConditions"]
		fromCollege <- map["fromCollege"]
		firstResult <- map["firstResult"]
		email <- map["email"]
		userHeight <- map["userHeight"]
		fromSchool <- map["fromSchool"]
		userCoordinate <- map["userCoordinate"]
		chatTime <- map["chatTime"]
		userExperience <- map["userExperience"]
		userAge <- map["userAge"]
		userStandard <- map["userStandard"]
		userName <- map["userName"]
		userPhone <- map["userPhone"]
		userIdcard <- map["userIdcard"]
		userCredit <- map["userCredit"]
		userIntegration <- map["userIntegration"]
		tel <- map["tel"]
		sortColumns <- map["sortColumns"]
		chatContent <- map["chatContent"]
		userPhoto <- map["userPhoto"]
		finallyLoginDate <- map["finallyLoginDate"]
		autoLogin <- map["autoLogin"]
		dynamicProperties <- map["dynamicProperties"]
		userWeight <- map["userWeight"]

    }
}
