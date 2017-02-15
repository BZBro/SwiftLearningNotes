//
//  String+AddText.swift
//  NoWait
//
//  Created by ZBin on 15/10/5.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import Foundation

extension String {
    
    mutating func addText(text: String?, withSeprator separator: String = " ") {
        if text != nil {
            if !self.isEmpty {
                self += separator
            }
            self += text!
        }
    }
}
