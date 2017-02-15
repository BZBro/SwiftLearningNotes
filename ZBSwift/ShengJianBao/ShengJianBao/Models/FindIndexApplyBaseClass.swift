//
//  FindIndexApplyBaseClass.swift
//
//  Created by Mike on 16/1/24
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON
import ObjectMapper

public class FindIndexApplyBaseClass: NSObject, Mappable, NSCoding {

    // MARK: Declaration for string constants to be used to decode and also serialize.
	internal let kFindIndexApplyBaseClassDataKey: String = "data"
	internal let kFindIndexApplyBaseClassMapKey: String = "map"
	internal let kFindIndexApplyBaseClassTotalRecordKey: String = "totalRecord"


    // MARK: Properties
	public var data: [FindIndexApplyData]?
	public var map: FindIndexApplyMap?
	public var totalRecord: Int?


    // MARK: SwiftyJSON Initalizers
    /**
    Initates the class based on the object
    - parameter object: The object of either Dictionary or Array kind that was passed.
    - returns: An initalized instance of the class.
    */
    convenience public init(object: AnyObject) {
        self.init(json: JSON(object))
    }

    /**
    Initates the class based on the JSON that was passed.
    - parameter json: JSON object from SwiftyJSON.
    - returns: An initalized instance of the class.
    */
    public init(json: JSON) {
		data = []
		if let items = json[kFindIndexApplyBaseClassDataKey].array {
			for item in items {
				data?.append(FindIndexApplyData(json: item))
			}
		} else {
			data = nil
		}
		map = FindIndexApplyMap(json: json[kFindIndexApplyBaseClassMapKey])
		totalRecord = json[kFindIndexApplyBaseClassTotalRecordKey].int

    }

    // MARK: ObjectMapper Initalizers
    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    required init?(_ map: Map){

    }

    /**
    Map a JSON object to this class using ObjectMapper
    - parameter map: A mapping from ObjectMapper
    */
    func mapping(map: Map) {
		data <- map[kFindIndexApplyBaseClassDataKey]
		map <- map[kFindIndexApplyBaseClassMapKey]
		totalRecord <- map[kFindIndexApplyBaseClassTotalRecordKey]

    }

    /**
    Generates description of the object in the form of a NSDictionary.
    - returns: A Key value pair containing all valid values in the object.
    */
    public func dictionaryRepresentation() -> [String : AnyObject ] {

        var dictionary: [String : AnyObject ] = [ : ]
		if data?.count > 0 {
			var temp: [AnyObject] = []
			for item in data! {
				temp.append(item.dictionaryRepresentation())
			}
			dictionary.updateValue(temp, forKey: kFindIndexApplyBaseClassDataKey)
		}
		if map != nil {
			dictionary.updateValue(map!.dictionaryRepresentation(), forKey: kFindIndexApplyBaseClassMapKey)
		}
		if totalRecord != nil {
			dictionary.updateValue(totalRecord!, forKey: kFindIndexApplyBaseClassTotalRecordKey)
		}

        return dictionary
    }

    // MARK: NSCoding Protocol
    required public init(coder aDecoder: NSCoder) {
		self.data = aDecoder.decodeObjectForKey(kFindIndexApplyBaseClassDataKey) as? [FindIndexApplyData]
		self.map = aDecoder.decodeObjectForKey(kFindIndexApplyBaseClassMapKey) as? FindIndexApplyMap
		self.totalRecord = aDecoder.decodeObjectForKey(kFindIndexApplyBaseClassTotalRecordKey) as? Int

    }

    public func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(data, forKey: kFindIndexApplyBaseClassDataKey)
		aCoder.encodeObject(map, forKey: kFindIndexApplyBaseClassMapKey)
		aCoder.encodeObject(totalRecord, forKey: kFindIndexApplyBaseClassTotalRecordKey)

    }

}
