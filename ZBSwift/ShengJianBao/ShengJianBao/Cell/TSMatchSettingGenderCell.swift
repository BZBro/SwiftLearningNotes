//
//  TSMatchSettingGenderCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/4/6.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSMatchSettingGenderCell: UITableViewCell {

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var famaleButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    @IBAction func handleGender(sender: AnyObject) {
        
        let button = sender as! UIButton
        button.selected = true
        
        if button == maleButton{
            famaleButton.selected = false
        }else{
            maleButton.selected = false
        }
    }
}
