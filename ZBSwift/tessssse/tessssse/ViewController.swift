//
//  ViewController.swift
//  tessssse
//
//  Created by ZBin on 15/10/5.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    //let segmentedCtrl:UISegmentedControl
    
    var currentImg : UIImageView
    var nextImg : UIImageView
    
    @IBOutlet weak var tempimage: UIImageView!

    @IBAction func Previous(sender: AnyObject) {
    }
    @IBAction func nex(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    
    func slideShow(slideShow: NHSlideShow!, didChangedSlideAtIndex slideIndex: Int) {
        
    }
    func slideShowShouldStartFromSlide(slideShow: NHSlideShow!) -> Int {
        return 1
    }
    func getImages() -> NSArray{
        var mrr:[UIImage] = []
        
        mrr.append(UIImage(named: "1.png")!)
        
        mrr.append(UIImage(named: "2.png")!)

        mrr.append(UIImage(named: "3.png")!)

        mrr.append(UIImage(named: "4.png")!)

        mrr.append(UIImage(named: "5.png")!)

        mrr.append(UIImage(named: "6.png")!)

        mrr.append(UIImage(named: "7.png")!)

        mrr.append(UIImage(named: "8.png")!)

        mrr.append(UIImage(named: "9.png")!)
        mrr.append(UIImage(named: "10.png")!)
        return mrr
    }
    func  runFadeAnimation(){
        tempimage?.image = UIImage(named: "1.png")
        tempimage!.alpha = 0.0
        UIView.animateWithDuration(kAnimationDuration, animations: { () -> Void in
            currentImg.alpha
            }, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
    
}

