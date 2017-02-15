//
//  DrawView.swift
//  DoodleMaker
//
//  Created by ZBin on 15/9/13.
//  Copyright © 2015年 ZBin. All rights reserved.
//

import UIKit
enum DrawingMode{
    case None
    case Paint
    case Erase
}
class DrawView: UIView {

    var selectedColor = UIColor.blackColor()
    var linewidth:CGFloat! = 8.0
    
    var previousPoint = CGPoint(x: 0, y: 0)
    var currentPoint = CGPoint(x: 0, y: 0)
    var drawingMode :DrawingMode?
    
    var viewImage : UIImage?
    override func drawRect(rect: CGRect) {
        if viewImage == nil{
           viewImage = UIImage()
        }
        viewImage?.drawInRect(self.bounds)
    }
    //MARK: - Touch Methods
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        if point != nil{
            previousPoint = point!
        }
    }
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        if point != nil{
            currentPoint = point!
            handleTouches()
        }
       
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let point = touch?.locationInView(self)
        if point != nil{
            currentPoint = point!
            handleTouches()
        }
    }
    private func handleTouches(){
        if drawingMode == DrawingMode.None{
            return
        }else if drawingMode == DrawingMode.Paint{
            DrawingNewLine()
        }else{
            eraseLine()
        }
    }
    @IBAction private func DrawingNewLine(){
        drawingMode = DrawingMode.Paint
        if viewImage == nil{
            return
        }
        //设置开始绘制image的环境
        UIGraphicsBeginImageContext(bounds.size)
        //image绘制的范围
        viewImage?.drawInRect(bounds)
        //创建图像绘制环境
        let graphicsContext = UIGraphicsGetCurrentContext()
        
        //笔画的结尾的形状，圆的还是方的
        CGContextSetLineCap(graphicsContext, CGLineCap.Butt)
        //绘制笔触颜色
        CGContextSetStrokeColorWithColor(graphicsContext, selectedColor.CGColor)
        //绘制笔触粗细
        CGContextSetLineWidth(graphicsContext, linewidth)
        //开始设置绘图路径
        CGContextBeginPath(graphicsContext)
        //开始绘制的点
        CGContextMoveToPoint(graphicsContext, previousPoint.x, previousPoint.y)
        //最终绘制的点
        CGContextAddLineToPoint(graphicsContext, currentPoint.x, currentPoint.y)
        //真正绘制路径
        CGContextStrokePath(graphicsContext)
        
        //从当前的上下文中得到图片
        viewImage = UIGraphicsGetImageFromCurrentImageContext()
        //结束image绘制的设置
        UIGraphicsEndImageContext()
        
        previousPoint = currentPoint
        //重绘画面
        setNeedsDisplay()
    }
    @IBAction private func eraseLine(){
        drawingMode = DrawingMode.Erase
        if viewImage == nil{
            return
        }
        UIGraphicsBeginImageContext(bounds.size)
        viewImage?.drawInRect(bounds)
        
        let graphicsContext = UIGraphicsGetCurrentContext()
        //混合绘制
        CGContextSetBlendMode(graphicsContext, CGBlendMode.Clear)
        //笔画的结尾的形状，圆的还是方的
        CGContextSetLineCap(graphicsContext, CGLineCap.Round)
        //绘制笔触颜色
        CGContextSetStrokeColorWithColor(graphicsContext, selectedColor.CGColor)
        //绘制笔触粗细
        CGContextSetLineWidth(graphicsContext, 16)
        //开始设置绘图路径
        CGContextBeginPath(graphicsContext)
        //开始绘制的点
        CGContextMoveToPoint(graphicsContext, previousPoint.x, previousPoint.y)
        //最终绘制的点
        CGContextAddLineToPoint(graphicsContext, currentPoint.x, currentPoint.y)
        //真正绘制路径
        CGContextStrokePath(graphicsContext)
        
        //从当前的上下文中得到图片
        viewImage = UIGraphicsGetImageFromCurrentImageContext()
        //结束image绘制的设置
        UIGraphicsEndImageContext()
        
        previousPoint = currentPoint
        //重绘画面
        setNeedsDisplay()
    }
}

