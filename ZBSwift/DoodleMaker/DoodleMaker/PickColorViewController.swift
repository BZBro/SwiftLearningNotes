//
//  PickColorViewController.swift
//  DoodleMaker
//
//  Created by ZBin on 15/9/13.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit
protocol PickColorViewControllerDelegate:class{
    func savacurrentColor(color:UIColor)
}


class PickColorViewController: UIViewController {
    
    weak var delegate:PickColorViewControllerDelegate?
    
    
    @IBOutlet weak var redImageview: UIImageView!
    @IBOutlet weak var greenImageview: UIImageView!
    @IBOutlet weak var blueImageview: UIImageView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    @IBOutlet weak var showDetailImage: UIImageView!
    var currentSelectedColor:UIColor?
    @IBAction func cancel(){
    
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func redSlider(sender: AnyObject) {
       getColorComponets()
    }
    @IBAction func greenSlider(sender: AnyObject) {
        getColorComponets()
    }
    @IBAction func blueSlider(sender: AnyObject) {
        getColorComponets()
    }
    @IBAction func alphaSlider(sender: AnyObject) {
        getColorComponets()
    }
    @IBAction func done(){
        delegate?.savacurrentColor(currentSelectedColor!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        getColorComponets()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: - Color
    func getColorComponets(){
        let red = CGFloat(redSlider.value)
        let green = CGFloat(greenSlider.value)
        let blue = CGFloat(blueSlider.value)
        let alpha = CGFloat(alphaSlider.value)
        
        currentSelectedColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
        
        configUI()
    }
    private func  configUI(){
       let colorComponets = CGColorGetComponents(currentSelectedColor?.CGColor)
        let red = colorComponets[0]
        let green = colorComponets[1]
        let blue = colorComponets[2]
        let alpha = colorComponets[3]
        updateUI(red, green: green, blue: blue, alpha: alpha)
        
    }
    private func updateUI(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat){
        redSlider.value = Float(red)
        greenSlider.value  = Float(green)
        blueSlider.value = Float(blue)
        alphaSlider.value = Float(alpha)
        
        redLabel.text = String(format: "%.2f", red)
        greenLabel.text = String(format: "%.2f", green)
        blueLabel.text = String(format: "%.2f", blue)
        alphaLabel.text = String(format: "%.2f", alpha)
        
        redImageview.backgroundColor = UIColor(red: red, green: 0, blue: 0, alpha: 1)
        greenImageview.backgroundColor = UIColor(red: 0, green: green, blue: 0, alpha: 1)
        blueImageview.backgroundColor = UIColor(red: 0, green: 0, blue: blue, alpha: 1)
        
        showDetailImage.backgroundColor = currentSelectedColor  
    }
    

}
