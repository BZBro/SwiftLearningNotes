//
//  TSMessageCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/20.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSFriendMessageCell: UITableViewCell {

    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var genderImage: UIImageView!
    @IBOutlet weak var schoolLabel: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!

    override func awakeFromNib() {

        super.awakeFromNib()
        
        avatarImage.layer.cornerRadius = 22
        avatarImage.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
