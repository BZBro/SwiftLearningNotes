//
//  TSMatchSettingLabelCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/4/6.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSMatchSettingLabelCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryType = .DisclosureIndicator
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
