//
//  TSDealerQuestionController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/23.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSDealerQuestionController: BaseViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var listTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "TSQuestionCell", bundle: nil)
        self.listTable.registerNib(nib, forCellReuseIdentifier: "TSQuestionCell")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("TSQuestionCell", forIndexPath: indexPath) as! TSQuestionCell
        
        return cell
    }

}
