//
//  TSJobTitleCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/3/29.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSJobTitleCell: UITableViewCell {

    @IBOutlet weak var jobTitle: UILabel!
    @IBOutlet weak var publishTime: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    
    var indexApply:MTIndexApply?{
        didSet{
            jobTitle.text = indexApply?.recruitTitle
            publishTime.text = indexApply?.beforData
            if indexApply?.views != nil {
                likeCount.text = "\(indexApply!.views!)"
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
