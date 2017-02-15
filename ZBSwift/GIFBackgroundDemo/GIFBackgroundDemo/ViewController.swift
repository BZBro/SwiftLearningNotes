//
//  ViewController.swift
//  GIFBackgroundDemo
//
//  Created by ZBin on 15/11/11.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webview: UIWebView!
    override func viewDidLoad() {
        let filePath = NSBundle.mainBundle().pathForResource("2", ofType: "gif")
        let data = NSData(contentsOfFile: filePath!)
        webview.loadData(data!, MIMEType: "image/gif", textEncodingName:String(), baseURL: NSURL())
        super.viewDidLoad()
        webview.userInteractionEnabled = false
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

