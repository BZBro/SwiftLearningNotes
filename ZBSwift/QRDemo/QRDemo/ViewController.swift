//
//  ViewController.swift
//  NoWait
//
//  Created by Admin on 15/9/16.
//  Copyright © 2015年 ZhangBin. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController,AVCaptureMetadataOutputObjectsDelegate{
    
    var myuser:NSUserDefaults?
    @IBOutlet weak var messageLabel:UILabel?
    var captureSession:AVCaptureSession?
    var videoPreviewLayer:AVCaptureVideoPreviewLayer?
    var qrCodeFrameView:UIView?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.showDetailInfo()
        self.captureSession?.startRunning()
        
    }
    
    @IBAction func cancel(){
        dismissViewControllerAnimated(true, completion: nil)
    }
    func nextVC(){
        performSegueWithIdentifier("ToShowDetailVC", sender: messageLabel?.text)
    }
    func showDetailInfo(){
        self.captureSession?.sessionPreset = AVCaptureSessionPresetHigh
        let captureDevice = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        
        // Get an instance of the AVCaptureDeviceInput class using the previous device object.
        var error:NSError?
        
        let input: AVCaptureDeviceInput!
        do {
            input = try AVCaptureDeviceInput(device: captureDevice)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        if (error != nil) {
            // If any error occurs, simply log the description of it and don't continue any more.
            print("\(error?.localizedDescription)")
            return
        }
        captureSession = AVCaptureSession()
        
        if captureSession!.canAddInput(input){
            captureSession?.addInput(input as AVCaptureInput)
        }
        let captureMetadataOutput = AVCaptureMetadataOutput()
        captureMetadataOutput.setMetadataObjectsDelegate(self, queue: dispatch_get_main_queue())
        
        if captureSession!.canAddOutput(captureMetadataOutput){
            captureSession?.addOutput(captureMetadataOutput)
            captureMetadataOutput.metadataObjectTypes = [AVMetadataObjectTypeQRCode]
        }
        captureSession?.startRunning()
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravityResizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        // Start video capture.
        
        view.bringSubviewToFront(messageLabel!)
        
        qrCodeFrameView = UIView()
        qrCodeFrameView?.layer.borderColor = UIColor.greenColor().CGColor
        qrCodeFrameView?.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView!)
        view.bringSubviewToFront(qrCodeFrameView!)
        
    }
    func captureOutput(captureOutput: AVCaptureOutput!,
        didOutputMetadataObjects metadataObjects: [AnyObject]!, fromConnection
        connection: AVCaptureConnection!) {
            
            // Check if the metadataObjects array is not nil and it contains at least one object.
            if metadataObjects == nil || metadataObjects.count == 0 {
                qrCodeFrameView?.frame = CGRectZero
                messageLabel!.text = "No QR code is detected"
                return
            }
            
            // Get the metadata object.
            let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
            
            if metadataObj.type == AVMetadataObjectTypeQRCode {
                // If the found metadata is equal to the QR code metadata then update the status label's text and set the bounds
                let barCodeObject =
                videoPreviewLayer?.transformedMetadataObjectForMetadataObject(metadataObj
                    as AVMetadataMachineReadableCodeObject) as!
                AVMetadataMachineReadableCodeObject
                qrCodeFrameView?.frame = barCodeObject.bounds;
                
                if metadataObj.stringValue != nil {
                    messageLabel!.text = metadataObj.stringValue
                    self.nextVC()
                }
                print("\(metadataObj.stringValue)")
            }
            
            self.captureSession?.stopRunning()
            
    }
    
    func alert(){
        let alert = UIAlertController(title: " ", message: "", preferredStyle: UIAlertControllerStyle.Alert)
        let actionReturn = UIAlertAction(title: "返回", style: UIAlertActionStyle.Default) { (UIAlertAction) -> Void in
            self.cancel()
        }
        let acationRefresh = UIAlertAction(title: "重试", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(acationRefresh)
        alert.addAction(actionReturn)
    }

}

