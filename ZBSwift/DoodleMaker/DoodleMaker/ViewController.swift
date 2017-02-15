//
//  ViewController.swift
//  DoodleMaker
//
//  Created by ZBin on 15/9/13.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PickColorViewControllerDelegate {
    
    @IBOutlet weak var colorButton: UIButton!

    @IBOutlet var drawView: DrawView!
    func  savacurrentColor(color: UIColor) {
        drawView.selectedColor = color
    }
    
    @IBAction private func  screenShot(){
        //开始在设定的范围中进行绘制操作
        UIGraphicsBeginImageContext(drawView.bounds.size)
        //指定要绘制的视图的layer
        drawView.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        //把指定的视图的layer层图形环境转化为UIImage类型
        let image = UIGraphicsGetImageFromCurrentImageContext()
        //结束绘制操作
        UIGraphicsEndImageContext()
        //将图片加入相册
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ToPickVC"{
            let pickVC = segue.destinationViewController as! PickColorViewController
            pickVC.delegate = self
        }
    }


}

