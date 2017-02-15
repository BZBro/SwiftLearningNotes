//
//  TSAboutUsController.swift
//  ShengJianBao
//
//  Created by welsonla on 16/1/24.
//  Copyright © 2016年 hyz. All rights reserved.
//

import UIKit

class TSAboutUsController: BaseViewController {

    @IBOutlet weak var aboutContent: UILabel!
    @IBOutlet weak var versionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "关于我们"
        
        let bundleDict = NSBundle.mainBundle().infoDictionary
        let version = bundleDict!["CFBundleShortVersionString"]!
        self.versionLabel.text = "VERSION \(version)"
        self.aboutContent.text = ""
        
        UserInfoService().getAbout { (result, data, error) in
            let dict = data as! Dictionary<String,AnyObject>
            let content = dict["content"] as? String
            let attrStr = try! NSAttributedString(
                data: content!.dataUsingEncoding(NSUnicodeStringEncoding, allowLossyConversion: true)!,
                options: [ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType],
                documentAttributes: nil)
            
            
            self.aboutContent.attributedText = attrStr
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
