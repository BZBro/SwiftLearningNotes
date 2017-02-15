//
//  SecondViewController.swift
//  TransitionTest
//
//  Created by ZBin on 15/10/8.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit

class SecondViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

    
}
extension SecondViewController:UIViewControllerTransitioningDelegate{
    func presentationControllerForPresentedViewController(presented: UIViewController, presentingViewController presenting: UIViewController, sourceViewController source: UIViewController) -> UIPresentationController? {
        <#code#>
    }
}