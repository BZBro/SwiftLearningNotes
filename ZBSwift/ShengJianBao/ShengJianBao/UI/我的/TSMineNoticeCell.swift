//
//  TSMineNoticeCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/2/16.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSMineNoticeCell: UITableViewCell {

    @IBOutlet weak var noticeTitle: UILabel!
    @IBOutlet weak var noticeDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(message:MTUserMessage){
        noticeTitle.text = message.messageTitle
        noticeDate.text = message.dateAdd
    }
    
}
