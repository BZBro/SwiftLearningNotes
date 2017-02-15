//
//  TSHomeBannerCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/22.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSHomeBannerCell: UITableViewCell {

    var menuSelectBlock:((Int)->Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func handleMenuSelect(button: UIButton) {
        if (self.menuSelectBlock != nil){
            let tag = button.tag - 100
            self.menuSelectBlock!(tag)
        }
    }
}
