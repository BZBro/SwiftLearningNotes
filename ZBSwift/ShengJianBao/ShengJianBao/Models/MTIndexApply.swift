//
//  MTIndexApply.m
//  Generate by ModelBot
//
//  Created by welsonla on 2016-01-27 22:26:54.
//  Copyright (c) 2016年 Autohome. All rights reserved.
//
import ObjectMapper

class MTIndexApply: Mappable {
	var cmd:String?
	var firstResult:Int?
	var timeType:String?
	var Id:Int?
	var sqlRestriction_sql:String?
	var workTypes:String?
	var addrCode:String?
	var queryDynamicConditions:[String:AnyObject]?
	var workType:String?
	var requireStandard:String?
	var examinationCode:String?
	var eq_userCode:String?
	var requireSum:Int?
	var recruitCode:String?
	var requireTime:Int?
	var addrCoor:String?
	var eq_verifyStatus:Int?
	var dateBegin:String?
	var dateEnd:String?
	var verifyStatus:Int?
	var recruitPhone:String?
	var userCode:String?
	var requireRight:Int?
	var requireExist:Int?
	var workWelfare:String?
	var views:Int?
	var linkman:String?
	var maxResults:Int?
	var examinationName:String?
	var recruitTitle:String?
	var like_addrCode:String?
	var recruitRemark:String?
	var requireSex:Int?
	var sortedConditions:[String:AnyObject]?
	var eq_timeType:String?
	var moneyStandard:Double?
	var addrDetail:String?
	var like_recruitTitle:String?
	var dateAdd:String?
	var beforData:String?
	var sortColumnsString:String?
	var requireHeight:Int?
	var topCount:String?
	var dynamicProperties:[String:AnyObject]?
	var success:String?
	var userName:String?
	var like_workType:String?
	var deleteFlag:Int?
	var sortColumns:String?
	var signUsers:String?
	var message:String?
	var requireWeight:Int?


    required init?(_ map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
		cmd <- map["cmd"]
		firstResult <- map["firstResult"]
		timeType <- map["timeType"]
		Id <- map["Id"]
		sqlRestriction_sql <- map["$sqlRestriction_sql"]
		workTypes <- map["workTypes"]
		addrCode <- map["addrCode"]
		queryDynamicConditions <- map["queryDynamicConditions"]
		workType <- map["workType"]
		requireStandard <- map["requireStandard"]
		examinationCode <- map["examinationCode"]
		eq_userCode <- map["$eq_userCode"]
		requireSum <- map["requireSum"]
		recruitCode <- map["recruitCode"]
		requireTime <- map["requireTime"]
		addrCoor <- map["addrCoor"]
		eq_verifyStatus <- map["$eq_verifyStatus"]
		dateBegin <- map["dateBegin"]
		dateEnd <- map["dateEnd"]
		verifyStatus <- map["verifyStatus"]
		recruitPhone <- map["recruitPhone"]
		userCode <- map["userCode"]
		requireRight <- map["requireRight"]
		requireExist <- map["requireExist"]
		workWelfare <- map["workWelfare"]
		views <- map["views"]
		linkman <- map["linkman"]
		maxResults <- map["maxResults"]
		examinationName <- map["examinationName"]
		recruitTitle <- map["recruitTitle"]
		like_addrCode <- map["$like_addrCode"]
		recruitRemark <- map["recruitRemark"]
		requireSex <- map["requireSex"]
		sortedConditions <- map["sortedConditions"]
		eq_timeType <- map["$eq_timeType"]
		moneyStandard <- map["moneyStandard"]
		addrDetail <- map["addrDetail"]
		like_recruitTitle <- map["$like_recruitTitle"]
		dateAdd <- map["dateAdd"]
		beforData <- map["beforData"]
		sortColumnsString <- map["sortColumnsString"]
		requireHeight <- map["requireHeight"]
		topCount <- map["topCount"]
		dynamicProperties <- map["dynamicProperties"]
		success <- map["success"]
		userName <- map["userName"]
		like_workType <- map["$like_workType"]
		deleteFlag <- map["deleteFlag"]
		sortColumns <- map["sortColumns"]
		signUsers <- map["signUsers"]
		message <- map["message"]
		requireWeight <- map["requireWeight"]

    }
}
