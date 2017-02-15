//
//  TopicTableViewCell.swift
//  ShengJianBao
//
//  Created by ZBin on 16/4/8.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TopicTableViewCell: UITableViewCell{
    
    
    var code = String()
    
    //头像
    @IBOutlet weak var avator: UIImageView!
    //性别
    @IBOutlet weak var useName: UILabel!
    //
    @IBOutlet weak var sexImage: UIImageView!
    //话题发布时间
    @IBOutlet weak var timeLabel: UILabel!
    //话题发布内容
    @IBOutlet weak var fromeSchool: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    //点赞
    @IBOutlet weak var collectButton: UIButton!
    //分享
    @IBOutlet weak var shareButton: UIButton!
    //评论
    @IBOutlet weak var commentButton: UIButton!
    //话题图片
    @IBOutlet weak var userUploadImage: UIImageView!
    
    //加好友
    @IBOutlet weak var addFriend: UIButton!
    
    @IBAction func collectButtonT(sender: UIButton){
        
        /**

        路径
        /user/userarticle/updateArticle
        
        提交方式
        POST
        
        传入参数
        {
        code:’680c0ac390bf41e7ac3bc134ed08f005’,//话题编号
        type:’1/2/3’,//类型（1：点赞2：分享3：评论）
        user:’385c68cabd5d465a8f23617b4a29f38b’//用户编号
        }
        
        返回参数
        {
        code：话题编号
        praiseUsers：点赞用户
        praiseNum：点赞数量
        }
        */
        
    }
    //
    @IBAction func shareButtonT(sender: UIButton){
        
    }
    //
    @IBAction func commentButtonT(sender: UIButton){
        
    }
    //
    @IBAction func addFriendT(sender: UIButton) {
        
        
        if AppContext.isLogin(){
            let story = UIStoryboard.init(name: "Club", bundle: nil)
            let addfriendVC = story.instantiateViewControllerWithIdentifier("addfriendVC") as! AddFriendViewController
            NSNotificationCenter.defaultCenter().addObserver(addfriendVC, selector: "getCode:", name: "addcodeNoti", object: nil)
            //topicDetailVC.indexApply = indexApply
            addfriendVC.hidesBottomBarWhenPushed = true
            self.viewController()?.navigationController?.pushViewController(addfriendVC, animated: true)
            let dic = [
                      "addcode":"\(self.code)"
                      ];
            NSNotificationCenter.defaultCenter().postNotificationName("addcodeNoti", object: dic)
        }
        else{
            AppContext.showLogin(self.viewController()!)
        }
        
    }
    
    
    

    var clubindexApply:MTClubApply!{
        didSet{
            if self.clubindexApply.logo == nil{
               self.avator.image = UIImage(named: "包子头")
            }else{
                let avatorimageURL:NSURL = NSURL(string:"http://www.shengjianbao.cc" + self.clubindexApply.logo!)!
                
                SDWebImageManager.sharedManager().downloadImageWithURL(avatorimageURL, options: SDWebImageOptions(), progress: { (min:Int, max:Int) -> Void in
                    
                    print("加载中 ")
                    
                    }) { (image:UIImage!, error:NSError!, cacheType:SDImageCacheType, finished:Bool, url:NSURL!) -> Void in
                        
                        if (image != nil)
                        {
                            self.avator.image = image
                            print("图片缓存完成")
                        }else{
                            print("无图片")
                        }
                        
                }
            }
            if self.clubindexApply.articlePicture == nil{
                self.avator.image = UIImage(named: "包子头")
            }else{
                let uploadimageimageURL:NSURL = NSURL(string: self.clubindexApply.articlePicture!)!
                
                SDWebImageManager.sharedManager().downloadImageWithURL(uploadimageimageURL, options: SDWebImageOptions(), progress: { (min:Int, max:Int) -> Void in
                    
                    print("加载中 ")
                    
                    }) { (image:UIImage!, error:NSError!, cacheType:SDImageCacheType, finished:Bool, url:NSURL!) -> Void in
                        
                        if (image != nil)
                        {
                            self.userUploadImage.image = image
                            print("图片缓存完成")
                        }
                        
                }
            }
            //x学校
            if self .clubindexApply.fromSchool == nil {
                self.fromeSchool.text = "无返回参数"
            }else{
                self.fromeSchool.text = self.clubindexApply.fromSchool
            }
            //性别
            if let sex = self.clubindexApply.sex  {
                if sex == 0{
                    self.sexImage.image = UIImage(named:"女")
                }
                else{
                    self.sexImage.image = UIImage(named:"男")
                }
            }
            let range = NSMakeRange(0, 10)
            let datestring:NSString = self.clubindexApply.dateAdd!
            self.timeLabel.text = datestring.substringWithRange(range)
            self.topicLabel.text = self.clubindexApply.articleContent
            self.collectButton.setTitle(String(self.clubindexApply.praiseNum!), forState: UIControlState.Normal)
            self.shareButton.setTitle(String(self.clubindexApply.shareNum!), forState: UIControlState.Normal)
            self.commentButton.setTitle(String(self.clubindexApply.evaluateNum!), forState: UIControlState.Normal)
            self.useName.text = self.clubindexApply.userName!
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if (avator.image == nil){
            avator.image = UIImage(named: "包子头");
        }
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
