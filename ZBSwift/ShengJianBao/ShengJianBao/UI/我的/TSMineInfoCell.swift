//
//  TSMineInfoCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/24.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSMineInfoCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var baomingCount: UILabel!
    @IBOutlet weak var luyongCount: UILabel!
    @IBOutlet weak var finishCount: UILabel!
    @IBOutlet weak var pingjiaCount: UILabel!
    
    var user:MTUser!{
        didSet{
            self.nameLabel.text = user.userName
        }
    }

    var userAct:MTUserActive!{
        didSet{
            if(userAct != nil){
                self.baomingCount.text = "\(userAct.workApply!)"
                self.luyongCount.text = "\(userAct.workGet!)"
                self.finishCount.text = "\(userAct.workFinished!)"
                self.pingjiaCount.text = "\(userAct.workBalance!)"
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
