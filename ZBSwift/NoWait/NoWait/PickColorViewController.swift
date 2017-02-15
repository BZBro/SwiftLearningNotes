//
//  PickColorViewController.swift
//  Sceaw
//
//  Created by Lxrent59 on 15/9/13.
//  Copyright © 2015年 twh. All rights reserved.
//

import UIKit

protocol PickColorViewControllerDelegate: class {
    func setPaintColor(controller:PickColorViewController,color:UIColor)

}

class PickColorViewController: UIViewController {
    
    @IBOutlet weak var alphaImageView: UIImageView!
    @IBOutlet weak var redImageView: UIImageView!
    @IBOutlet weak var greenImageView: UIImageView!
    @IBOutlet weak var blueImageView: UIImageView!
    
    @IBOutlet weak var AddResultimage: UIImageView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var resultImageView: UIImageView!
    
    weak var delegate:PickColorViewControllerDelegate?
    
    var currentSelectedColor:UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        let mode = NSUserDefaults.standardUserDefaults().boolForKey("NIGHT")
        if mode {
            UITabBar.appearance().barTintColor = UIColor.whiteColor()
        }else{
            UITabBar.appearance().barTintColor = UIColor.blackColor()
        }

    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        loadColor(currentSelectedColor)
        redImageView.layer.cornerRadius = 32
        blueImageView.layer.cornerRadius = 32
        greenImageView.layer.cornerRadius = 32
        alphaImageView.layer.cornerRadius = 32
        if view.bounds.size.height == 480 {
            resultImageView.alpha = 0
            AddResultimage.layer.cornerRadius = 60
        }else{
            AddResultimage.alpha = 0
            resultImageView.layer.cornerRadius = 90
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MAEK: - Response Methods
    @IBAction func cancelButtonTapped(sender: UIBarButtonItem) {
        delegate?.setPaintColor(self, color: currentSelectedColor)
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func redSliderMove(sender: UISlider) {
        getMassage()
    }
    
    
    @IBAction func greenSliderMove(sender: UISlider) {
        getMassage()
    }
    
    @IBAction func blueSliderMove(sender: UISlider) {
        getMassage()
    }
    
    @IBAction func alphaSliderMove(sender: UISlider) {
        getMassage()
    }
    
    func loadColor(currentcolor:UIColor){
        let colorComponents = CGColorGetComponents(currentcolor.CGColor)
        let red = colorComponents[0]
        let green = colorComponents[1]
        let blue = colorComponents[2]
        let alpha = colorComponents[3]
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        alphaSlider.value = Float(alpha)
    }
    func getMassage(){
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        currentSelectedColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        configureUI()
    }
    
    
    //MARK: - Configure UI
    private func configureUI(){
        let colorComponents = CGColorGetComponents(currentSelectedColor.CGColor)
        let red = colorComponents[0]
        let green = colorComponents[1]
        let blue = colorComponents[2]
        let alpha = colorComponents[3]
        updateUI(red,green: green,blue: blue,alpha: alpha)
    }
    private func updateUI(red: CGFloat, green: CGFloat,blue:CGFloat,alpha:CGFloat ){
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        alphaSlider.value = Float(alpha)
        
        redImageView.backgroundColor = UIColor(red: red, green: 0, blue: 0, alpha: 1)
        blueImageView.backgroundColor = UIColor(red: 0, green: 0, blue: blue, alpha: 1)
        greenImageView.backgroundColor = UIColor(red: 0, green: green, blue:0 , alpha: 1)
        alphaImageView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: alpha)
        resultImageView.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        AddResultimage.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    
}