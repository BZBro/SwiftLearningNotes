//
//  TSJobInfoCell.swift
//  ShengJianBao
//
//  Created by welsonla on 16/3/29.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSJobInfoCell: UITableViewCell {

    @IBOutlet weak var jobType: UILabel!
    @IBOutlet weak var needCount: UILabel!
    @IBOutlet weak var salaryNumber: UILabel!
    @IBOutlet weak var workTime: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var baseTask: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var employer: UILabel!
    
    var indexApply:MTIndexApply?{
        didSet{
            if indexApply != nil {
                self.address.text = indexApply?.addrDetail!
                self.startTime.text = "到岗时间:\(indexApply!.dateBegin!)"
                self.baseTask.text = "底薪任务:\(indexApply!.recruitRemark!)"
                if  indexApply!.requireSum != nil{
                    self.needCount.text = "\(indexApply!.requireSum!)人"
                }
                if indexApply?.moneyStandard != nil {
                    self.salaryNumber.text = "\(indexApply!.moneyStandard!)/天"
                }
                
                if indexApply?.linkman != nil {
                    self.employer.text = indexApply!.linkman
                }
                
                if indexApply?.workType != nil {
                    self.jobType.text =  indexApply!.workTypes
                }
                
                if indexApply?.dateBegin != nil && indexApply?.dateEnd != nil{
                    self.workTime.text = "\(indexApply!.dateBegin!)-\(indexApply!.dateEnd!)"
                }
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
