//
//  TSFriendAddCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/21.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSFriendInviteCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var message: UILabel!
    @IBOutlet weak var actionButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        actionButton.layer.cornerRadius = 5
        actionButton.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
