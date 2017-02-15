//
//  TaoShengJianOption.swift
//  ShengJianBao
//
//  Created by Mike on 16/1/10.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit
import SnapKit

class TaoShengJianOption: UIView,UITableViewDataSource,UITableViewDelegate {
    
    var optionBtns : Array<UIView> = Array()
    
    var left:UITableView!
    var right:UITableView!
    var coverView:UIView!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    func initView(){
        let superView = self
        
        let titles = ["职位","结算方式","日期","智能筛选"]
        
        for(var i:Int = 0;i<4;i++){
            let v = UIView(frame: CGRectZero)
            //v.backgroundColor = UIColor.redColor()
            
            let titleLable = UILabel(frame: CGRectZero)
            v.addSubview(titleLable)
            
            titleLable.snp_makeConstraints(closure: { (make) -> Void in
                make.centerX.equalTo(v)
                make.centerY.equalTo(v)
                make.width.greaterThanOrEqualTo(0)
                make.height.greaterThanOrEqualTo(0)
            })
            titleLable.font = UIFont.systemFontOfSize(14)
            titleLable.text = titles[i]
            self.addSubview(v)
            optionBtns.append(v)
            
            let tap = UITapGestureRecognizer(target: self, action: "onViewClick:")
            v.tag = i
            v.addGestureRecognizer(tap)
        }
        
       let v0 = optionBtns[0]
       let v1 = optionBtns[1]
       let v2 = optionBtns[2]
       let v3 = optionBtns[3]
        
        v0.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(superView)
            make.height.equalTo(superView)
            make.centerY.equalTo(superView)
            make.width.equalTo(superView).multipliedBy(1/4.0)
        }
        
        v1.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(v0.snp_trailing)
            make.height.equalTo(superView)
            make.centerY.equalTo(superView)
            make.width.equalTo(superView).multipliedBy(1/4.0)
        }
        
        v2.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(v1.snp_trailing)
            make.height.equalTo(superView)
            make.centerY.equalTo(superView)
            make.width.equalTo(superView).multipliedBy(1/4.0)
        }
        
        v3.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(v2.snp_trailing)
            make.height.equalTo(superView)
            make.centerY.equalTo(superView)
            make.width.equalTo(superView).multipliedBy(1/4.0)
        }
        
    }
    
    func onViewClick(sender:UITapGestureRecognizer){
        let targetView = sender.view!
        switch targetView.tag{
            case 0:
                onViewClick0(targetView)
                break
        case 1:
            onViewClick1(targetView)
            break
        case 2:
            onViewClick2(targetView)
            break
        case 3:
            onViewClick3(targetView)
            break
        default:
            break
        }
    }
    
    func onViewClick0(sender:UIView){
        if coverView != nil{
            coverView.removeFromSuperview()
            coverView = nil
            left = nil
            right = nil
        }
        
        left = UITableView(frame: CGRectZero)
        left.registerNib(UINib(nibName: "OptionTableViewCell", bundle: nil), forCellReuseIdentifier: "OptionTableViewCell")
        
        left.delegate = self
        left.dataSource = self
        
        right = UITableView(frame: CGRectZero)
        right.registerNib(UINib(nibName: "OptionTableViewCell", bundle: nil), forCellReuseIdentifier: "OptionTableViewCell")

        right.delegate = self
        right.dataSource = self
        
        let v = UIView(frame: CGRectZero)
        let bgBtn = UIButton(frame: CGRectZero)
        bgBtn.addTarget(self, action: "onbgBtnClick:", forControlEvents: UIControlEvents.TouchUpInside)
        bgBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.8)
        
        let controllerView = self.superview
        
        controllerView?.addSubview(v)
        
        v.addSubview(bgBtn)
        v.addSubview(left)
        v.addSubview(right)
        
        v.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(self.snp_bottom)
            make.bottom.equalTo((controllerView?.snp_bottom)!)
            make.leading.equalTo(controllerView!)
            make.trailing.equalTo(controllerView!)
        }
        bgBtn.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(0)
        }
        
        left.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(v)
            make.width.equalTo(v).multipliedBy(0.5)
            make.top.equalTo(v)
            make.height.equalTo(v).offset(-200)
        }
        
        
        right.snp_makeConstraints { (make) -> Void in
            make.leading.equalTo(left.snp_trailing)
            make.width.equalTo(left)
            make.top.equalTo(v)
            make.height.equalTo(v).offset(-200)
        }
        
        coverView = v
        
        
    }
    func onViewClick1(sender:UIView){
        
    }
    func onViewClick2(sender:UIView){
        
    }
    func onViewClick3(sender:UIView){
        
    }
    
    func onbgBtnClick(sender:UIButton){
        coverView.removeFromSuperview()
    }
    
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        if (indexPath.section == 0){
//            return 88
//        }else{
//            return 43
//        }
//    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("OptionTableViewCell", forIndexPath: indexPath)
        return cell

    }
    


    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
