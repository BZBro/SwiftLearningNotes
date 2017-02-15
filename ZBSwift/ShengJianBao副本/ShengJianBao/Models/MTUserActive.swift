//
//  MTUserActive.m
//  Generate by ModelBot
//
//  Created by welsonla on 2016-03-26 11:26:04.
//  Copyright (c) 2016年 Autohome. All rights reserved.
//
import ObjectMapper

class MTUserActive: Mappable {
	var firstResult:Int?
	var maxResults:Int?
	var success:String?
	var queryDynamicConditions:[String:AnyObject]?
	var workComment:Int?
	var userPhone:String?
	var workGet:Int?
	var cmd:String?
	var workBalance:Int?
	var dynamicProperties:[String:AnyObject]?
	var workFinished:Int?
	var topCount:String?
	var sortColumns:String?
	var Id:Int?
	var message:String?
	var userCode:String?
	var sortColumnsString:String?
	var workApply:Int?
	var sortedConditions:[String:AnyObject]?


    required init?(_ map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
		firstResult <- map["firstResult"]
		maxResults <- map["maxResults"]
		success <- map["success"]
		queryDynamicConditions <- map["queryDynamicConditions"]
		workComment <- map["workComment"]
		userPhone <- map["userPhone"]
		workGet <- map["workGet"]
		cmd <- map["cmd"]
		workBalance <- map["workBalance"]
		dynamicProperties <- map["dynamicProperties"]
		workFinished <- map["workFinished"]
		topCount <- map["topCount"]
		sortColumns <- map["sortColumns"]
		Id <- map["Id"]
		message <- map["message"]
		userCode <- map["userCode"]
		sortColumnsString <- map["sortColumnsString"]
		workApply <- map["workApply"]
		sortedConditions <- map["sortedConditions"]

    }
}
