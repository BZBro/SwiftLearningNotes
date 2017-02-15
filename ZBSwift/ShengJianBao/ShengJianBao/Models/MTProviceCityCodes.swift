//
//  MTProviceCityCodes.m
//  Generate by ModelBot
//
//  Created by welsonla on 2016-03-26 17:34:48.
//  Copyright (c) 2016年 Autohome. All rights reserved.
//
import ObjectMapper

class MTProviceCityCodes: Mappable {
	var Id:Int?
	var areaLevel:Int?
	var message:String?
	var maxResults:Int?
	var deleteFlag:Int?
	var success:String?
	var areaLetter:String?
	var sortColumns:String?
	var cmd:String?
	var areaName:String?
	var firstResult:Int?
	var topCount:String?
	var areaCode:Int?
	var sortColumnsString:String?


    required init?(_ map: Map) {

    }

    // Mappable
    func mapping(map: Map) {
		Id <- map["Id"]
		areaLevel <- map["areaLevel"]
		message <- map["message"]
		deleteFlag <- map["deleteFlag"]
		success <- map["success"]
		areaLetter <- map["areaLetter"]
		cmd <- map["cmd"]
		areaName <- map["areaName"]
		firstResult <- map["firstResult"]
		topCount <- map["topCount"]
		areaCode <- map["areaCode"]
    }
}
