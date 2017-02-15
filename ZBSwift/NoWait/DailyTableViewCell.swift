//
//  DailyTableViewCell.swift
//  NoWait
//
//  Created by ZBin on 15/10/18.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit

class DailyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var BackGroundImage: UIImageView!
    
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var thumbnailImage: UIImageView!
    
    @IBOutlet weak var dailyLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        BackGroundImage.layer.cornerRadius = BackGroundImage.frame.size.width / 10
        thumbnailImage.layer.cornerRadius = thumbnailImage.frame.size.width / 3
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func showDetail(tempdaily:MyDaily){
        let red = CGFloat((tempdaily.myColorR)!)
        let green = CGFloat((tempdaily.myColorG)!)
        let blue = CGFloat((tempdaily.myColorB)!)
        let alpha = CGFloat((tempdaily.myColorA)!)
        dateLabel.text = tempdaily.myDate
        dailyLabel.text = tempdaily.myDaily
        dailyLabel.textColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        if let image = showMyPhotoImage(tempdaily) {
            thumbnailImage.image = image
        }
    }
    func showMyPhotoImage(daily: MyDaily?) -> UIImage?{
        if let tempdaily = daily {
            if tempdaily.hasPhoto {
                if let image = tempdaily.photoImage {
                    return image.resizedImageWithBounds(CGSize(width: 100, height: 100))
                }
            }
            else if tempdaily.photoID == nil {
                if let image = tempdaily.tempImage {
                    return image.resizedImageWithBounds(CGSize(width: 100, height: 100))
                }
            }
        }
        
        return nil
    }
    
}
