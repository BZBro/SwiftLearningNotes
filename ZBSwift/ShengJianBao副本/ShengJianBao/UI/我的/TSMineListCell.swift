//
//  TSMineListCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/24.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSMineListCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
