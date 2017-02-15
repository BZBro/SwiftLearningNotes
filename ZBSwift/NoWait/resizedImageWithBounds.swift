//
//  resizedImageWithBounds.swift
//  NoWait
//
//  Created by ZBin on 15/11/5.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import Foundation
import UIKit
extension UIImage {
    func resizedImageWithBounds(bounds: CGSize) -> UIImage {
        let horizontalRatio = bounds.width / size.width
        
        let verticalRatio = bounds.height / size.width
        
        let ratio = min(horizontalRatio, verticalRatio)
        
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        
        drawInRect(CGRect(origin: CGPoint.zero, size: newSize))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return newImage
    }
}