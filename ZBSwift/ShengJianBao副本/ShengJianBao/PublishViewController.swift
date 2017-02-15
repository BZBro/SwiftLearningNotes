//
//  PublishViewController.swift
//  ShengJianBao
//
//  Created by ZBin on 16/4/8.
//  Copyright © 2016年 hyz. All rights reserved.
//



/*
路径
/user/userarticle/saveEntity

提交方式
POST

传入参数
{
cmd:’new’,//固定参数（代表新增）
user:’ee5a4f5cc59b42778666b5b4bb2e5b58’,//用户编号
articleContent:’大家好’,//话题内容
anonymity:1, //匿名发布
importedFile:’’//上传图片
}

返回参数
{
success:true/false 成功/失败
}

 */
import UIKit
import Alamofire
import AlamofireObjectMapper
import SwiftyJSON
class PublishViewController: UIViewController,UITextViewDelegate {

    //留白
    var textString = "   ";
    
    var anonymousBool:Bool  = false
    
    
    @IBOutlet weak var postButton: UIButton!
    
    @IBOutlet weak var checkImage: UIImageView!
    
    @IBOutlet weak var addImage: UIButton! //图1
    
    @IBOutlet weak var image1: UIImageView!
    
    //添加图1
    @IBAction func addImage1(sender: UIButton) {
        pickMenu()
    }
    

    
    
    //匿名发布
    @IBAction func anonymousPost(sender: UIButton) {
        
        if !sender.selected {
            sender.selected = true
            anonymousBool = true
            self.checkImage.image = UIImage(named: "checkin")
        }else{
            sender.selected = false
            anonymousBool = false
            self.checkImage.image = UIImage(named: "checkout")
        }
    }
   
    
    //发布按钮
    @IBAction func POST(sender: UIButton) {
        let text = (self.describeTextField.text as NSString!)
        if text.length <= 6 {
            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
            hud.labelText = "请添加内容"
            hud.mode = .Text
            hud.opacity = 0.5
            hud.hide(true, afterDelay: 0.8)
        }else{
            
            self.PublishTopic()
        }
        
    }
    //话题内容
    @IBOutlet weak var describeTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.postButton.enabled  = false
        describeTextField.delegate = self;
        addImage.layer.borderWidth = 1;
        addImage.layer.borderColor = UIColor(red: 235/255, green: 235/255, blue: 235/255, alpha: 1).CGColor

    }
    func PublishTopic(){
        
//        {
//            cmd:’new’,//固定参数（代表新增）   
//            user:’ee5a4f5cc59b42778666b5b4bb2e5b58’,//用户编号
//            articleContent:’大家好’,//话题内容
//            anonymity:1, //匿名发布
//            importedFile:’’//上传图片
//        }
//        
//        返回参数
//            {
//                success:true/false 成功/失败
//        }
//
        let MTUserInfo:MTUser! = AppContext.user()
        
        let usercode = MTUserInfo.userCode
        
        print(usercode!)
        
        var imageData = NSData()
        if image1.image == nil{
            
        }else{
            imageData = UIImageJPEGRepresentation(image1.image!, 0.5)!
        }
        

     
//        NetworkEngine.POST("/user/userarticle/saveEntity", parameters: ["cmd":"new","user":"\(usercode!)","articleContent":"\(self.describeTextField.text)","anonymity":"\(anonymousBool.hashValue)","importedFile":"\(imageData)"]).responseString(completionHandler: { (respon) -> Void in
// 
//            print("----------------------",respon)
//            //回调处理
//            if (respon.result.value != nil){
//                let indexRespon = respon.result.value!
//                print(indexRespon)
//            }
//        })
        
        Alamofire.upload(.POST, "http://www.shengjianbao.cc/user/userarticle/saveEntity", multipartFormData: { (multipartFormData) -> Void in
            let cmddata = NSString(string: "new").dataUsingEncoding(NSUTF8StringEncoding)
            let userdata = NSString(string:usercode!).dataUsingEncoding(NSUTF8StringEncoding)
            let articdata = self.describeTextField.text.dataUsingEncoding(NSUTF8StringEncoding)
            let anonymitydata = String(self.anonymousBool.hashValue).dataUsingEncoding(NSUTF8StringEncoding)
            multipartFormData.appendBodyPart(data: cmddata!, name: "cmd")
            multipartFormData.appendBodyPart(data: userdata!, name: "user")
            multipartFormData.appendBodyPart(data: articdata!, name: "articleContent")
            multipartFormData.appendBodyPart(data: anonymitydata!, name: "anonymity")
            multipartFormData.appendBodyPart(data: imageData, name: "importedFile")
            }) { (encodingResult) -> Void in
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseJSON { response in
                        let json = JSON(data: response.data!)
                        print(response.result.value)
                        let success = json["success"].intValue
                        
                        if success == 1{
                            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                            hud.labelText = "发布成功"
                            hud.mode = .Text
                            hud.opacity = 0.5
                            hud.hide(true, afterDelay: 0.8)
                            
                        }else{
                            let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
                            hud.labelText = "发布失败，请检查网络"
                            hud.mode = .Text
                            hud.opacity = 0.5
                            hud.hide(true, afterDelay: 0.8)
                            
                        }
                    }
                case .Failure(let encodingError):
                    print(encodingError)
                }
        }
        
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK: - Delegate M  代理方法
    
    func textViewDidBeginEditing(textView: UITextView) {
        textView.text = textString as String;
    }
    
    func textViewDidEndEditing(textView: UITextView) {
        textString = textView.text;
        let text = (self.describeTextField.text as NSString!)
        self.postButton.enabled  = true
        print(textString)
    }
    
    
}
    //MARK: - 照片选择器
extension PublishViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    func pickMenu(){
        let alert = UIAlertController(title: "选择图片", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
        let actionCamera = UIAlertAction(title: "相机", style: UIAlertActionStyle.Default) { _ in
            self.pickImageFromCamera()
        }
        let actionLibrary = UIAlertAction(title: "图库", style: UIAlertActionStyle.Default) { _ in
            self.chooseImageFromLibrary()
        }
        let actionCancel = UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil)
        alert.addAction(actionCamera)
        alert.addAction(actionLibrary)
        alert.addAction(actionCancel)
        presentViewController(alert,animated:true,completion:nil)
    }
    
    func pickImageFromCamera(){
        let imagePicker = ImagePickerController()
        
        imagePicker.view.tintColor = UIColor(red:0.99, green:0.85, blue:0.03, alpha:1)
        
        imagePicker.delegate = self
        imagePicker.sourceType = UIImagePickerControllerSourceType.Camera
        imagePicker.allowsEditing = true
        presentViewController(imagePicker,animated: true, completion: nil)
    }
    
    func chooseImageFromLibrary (){
        //创建一个视图拾取器
        let imagePicker = ImagePickerController()
        
        imagePicker.view.tintColor = UIColor(red: 40/225.0, green: 140/255.0, blue: 255/225.0, alpha: 1)
        //设置视图拾取器的数据源类型
        imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        imagePicker.delegate = self
        //允许视图拾取器进行编辑
        imagePicker.allowsEditing = true
        //模态出现视图拾取器
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        let image = info[UIImagePickerControllerEditedImage] as? UIImage
        showPhotoImage(image)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        let hud = MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        hud.labelText = "没有选取照片"
        hud.mode = .Text
        hud.opacity = 0.5
        hud.hide(true, afterDelay: 0.8)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func showPhotoImage(image: UIImage?){
        if let image = image {
            image1.image = image
            image1.hidden = false
        }
    }
}
