//
//  TSBusinessBaseInfoCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/3/30.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSBusinessBaseInfoCell: UITableViewCell {

    @IBOutlet weak var companyImage: UIImageView!
    @IBOutlet weak var companyName: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
