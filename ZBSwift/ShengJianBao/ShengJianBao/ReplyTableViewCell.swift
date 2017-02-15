//
//  ReplyTableViewCell.swift
//  ShengJianBao
//
//  Created by ZBin on 16/4/9.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class ReplyTableViewCell: UITableViewCell{
    
    @IBOutlet weak var avatorImageView: UIImageView!
    
    @IBOutlet weak var replyDescriptionLabel: UILabel!
    
    @IBOutlet weak var replyTime: UILabel!
    
    @IBOutlet weak var replyUserNameLabel: UILabel!
    
    override func awakeFromNib() {
       
        super.awakeFromNib()
        // Initialization code
    }

    var clubindexApply:MTClubApply!{
        didSet{
            if self.clubindexApply.logo == nil{
                self.avatorImageView.image = UIImage(named: "包子人")
            }else{
                let avatorimageURL:NSURL = NSURL(string:"http://www.shengjianbao.cc" + self.clubindexApply.logo!)!
                
                SDWebImageManager.sharedManager().downloadImageWithURL(avatorimageURL, options: SDWebImageOptions(), progress: { (min:Int, max:Int) -> Void in
                    
                    print("加载中 ")
                    
                    }) { (image:UIImage!, error:NSError!, cacheType:SDImageCacheType, finished:Bool, url:NSURL!) -> Void in
                        
                        if (image != nil)
                        {
                            self.avatorImageView.image = image
                            print("图片缓存完成")
                        }else{
                            print("无图片")
                        }
                }
            }
            let range = NSMakeRange(0, 10)
            let datestring:NSString = self.clubindexApply.dateAdd!
            self.replyTime.text = datestring.substringWithRange(range)
            self.replyUserNameLabel.text = self.clubindexApply.userName!
            self.replyDescriptionLabel.text = self.clubindexApply.articleContent
        }
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
