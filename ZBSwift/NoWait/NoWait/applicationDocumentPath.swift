//
//  applicationDocumentPath.swift
//  NoWait
//
//  Created by ZBin on 15/10/17.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import Foundation

let applicationDocumentPath: String  = {
    
    let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as [String]
    
    return paths[0]
    
}()