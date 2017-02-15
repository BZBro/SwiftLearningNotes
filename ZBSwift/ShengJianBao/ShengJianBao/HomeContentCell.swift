//
//  HomeContentCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/27.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class HomeContentCell: UITableViewCell {

    @IBOutlet weak var contentTitle: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var timelabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    
    var indexApply:MTIndexApply!{
        didSet{
            self.contentTitle.text = self.indexApply.recruitTitle
            self.location.text = self.indexApply.addrDetail
            self.timelabel.text = self.indexApply.beforData
            
            //高亮"/天"
            let dayDict = [NSFontAttributeName:UIFont.systemFontOfSize(12),
                            NSForegroundColorAttributeName:UIColor.grayColor()]
            
            let labelDict = [NSFontAttributeName:self.priceLabel.font,
                             NSForegroundColorAttributeName:self.priceLabel.textColor]
            let price = "\(self.indexApply.moneyStandard!)元/天"
            let priceAttrString = NSMutableAttributedString(string: price,attributes: labelDict)
            
            priceAttrString.addAttributes(dayDict, range: NSMakeRange(price.characters.count-2, 2))
            
            self.priceLabel.attributedText = priceAttrString
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
