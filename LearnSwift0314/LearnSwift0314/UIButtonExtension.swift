//
//  UIButtonExtension.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/14.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

extension UIButton {
    
    //将子视图添加到父视图中
    func jsonxczAddViewToSupView(supView:UIView,subView:UIView) -> UIButton{
        supView.addSubview(subView)
        return self
    }
    
    //将子视图添加到父视图中
    func jsonxczAddViewToSupView(supView:UIView) -> UIButton{
        supView.addSubview(self)
        return self
    }
    
    //设置按钮上的背景颜色
    func jsonxczSetbackgroundColor(backgroundColor:UIColor) -> UIButton{
        self.backgroundColor = backgroundColor
        return self
    }
    
    //设置按钮上的文字
    func jsonxczSetTitle(title:String) -> UIButton{
        self.setTitle(title, for: UIControlState.normal)
        return self
    }
    
    //设置按钮上的文字
    func jsonxczSetTitle(title:String,highlighted:UIControlState) -> UIButton{
        self.setTitle(title, for: highlighted)
        return self
    }
    
    //设置按钮上的文字
    func jsonxczSetTitle(title:String,disabled:UIControlState) -> UIButton{
        self.setTitle(title, for: disabled)
        return self
    }
    // 设置背景图片(图片会被拉伸充满整个btn.frame)
    func jsonxczSetBackgroundImage(image:UIImage) -> UIButton{
        self.setBackgroundImage(image, for: UIControlState.normal)
        return self
    }
    
    // 设置按钮上的图片（图片不会被拉伸，原比例显示在btn.frame）
    func jsonxczSetImage(image:UIImage) -> UIButton{
        self.setImage(image, for: UIControlState.normal)
        return self
    }
    
    // 设置按钮上的图片（图片不会被拉伸，原比例显示在btn.frame）
    func jsonxczAddTarget(target:Any,action:Selector) -> UIButton{
        self.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return self
    }
    
    
    /// 设置按钮圆角
    ///
    /// - Parameter radius: 圆角的大小
    /// - Returns: 返回按钮
    func jsonxczSetCornerRadius(radius:CGFloat) -> UIButton{
        self.layer.masksToBounds = true
        self.layer.cornerRadius = radius
        return self
    }
    
    /*-------------------------------------------------------------------------------------------------------------------------*/
    /*-------------------------------------------------------------------------------------------------------------------------*/
    /*-------------------------------------------------------------------------------------------------------------------------*/
    
    /*实现UIButton通过闭包添加事件*/
    //在结构体中定义了一个闭包属性
    struct AssociatedClosureClass {
        var eventClosure: (UIButton)->()
    }
    
    private struct AssociatedKeys {
        static var eventClosureObj:AssociatedClosureClass?
    }
    
    private var eventClosureObj: AssociatedClosureClass{
        set{
            objc_setAssociatedObject(self, &AssociatedKeys.eventClosureObj, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        get{
            return (objc_getAssociatedObject(self, &AssociatedKeys.eventClosureObj) as? AssociatedClosureClass)!
        }
    }
    
    func jsonxczAddTarget(for controlEvents: UIControlEvents,action:@escaping (UIButton)->()) -> UIButton{
        let eventObj = AssociatedClosureClass(eventClosure: action)
        eventClosureObj = eventObj
        addTarget(self, action: #selector(eventExcuate(_:)), for: controlEvents)
        return self
    }
    
    @objc private func eventExcuate(_ sender: UIButton){
        eventClosureObj.eventClosure(sender)
    }
    
    /*-------------------------------------------------------------------------------------------------------------------------*/
    /*-------------------------------------------------------------------------------------------------------------------------*/
    /*-------------------------------------------------------------------------------------------------------------------------*/
    
    
    /// 设置按钮的文字大小
    ///
    /// - Parameter fontSize: 文字大小的值
    /// - Returns: 返回按钮
    func jsonxczSetFontSize(fontSize:CGFloat) -> UIButton{
        self.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
        return self
    }
    
    /// 初始化按钮
    ///
    /// - Parameter frame: 按钮frame
    /// - Returns: 返回按钮
   class func jsonxczInit(frame:CGRect) -> UIButton{
        let btn = UIButton(frame: frame)
        btn.backgroundColor = UIColor.red
        return btn
    }
    
    
    /// 初始化按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮frame
    ///   - backgroundColor: 按钮背景颜色
    /// - Returns: 返回按钮
    class func jsonxczInit(frame:CGRect,backgroundColor:UIColor) -> UIButton{
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        return btn
    }
    
    
    /// 初始化按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮frame
    ///   - backgroundColor: 按钮背景颜色
    ///   - action: 按钮事件
    ///   - target: 按钮事件所在的位置
    /// - Returns: 返回按钮
    class func jsonxczInit(frame:CGRect,backgroundColor:UIColor,action:Selector, target:Any) -> UIButton{
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return btn
    }
    
    class func jsonxczInits(frame:CGRect,backgroundColor:UIColor, target:Any,action:Selector) -> UIButton {
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return btn
    }
    
    
    /// 初始化按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮frame
    ///   - backgroundColor: 按钮背景颜色
    ///   - title: 按钮标题
    ///   - textColor: 按钮标题颜色
    /// - Returns: 返回按钮
    class func jsonxczInit(frame:CGRect,backgroundColor:UIColor,title:String,textColor:UIColor) -> UIButton{
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        btn.setTitle(title, for: UIControlState.normal)
        btn.titleLabel!.textColor = textColor
        return btn
    }
    
    
    /// 初始化按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮frame
    ///   - title: 按钮标题
    /// - Returns: 返回按钮
    class func jsonxczInit(frame:CGRect,title:String) -> UIButton {
        let btn = jsonxczInit(frame: frame)
        btn.setTitle(title, for: UIControlState.normal)
        return btn
    }
    
    
    /// 初始化按钮
    ///
    /// - Parameters:
    ///   - frame: 按钮frame
    ///   - title: 按钮标题
    ///   - backgroundColor: 按钮背景颜色
    /// - Returns: 返回按钮
    class func jsonxczInit(frame:CGRect,title:String,backgroundColor:UIColor) -> UIButton {
        let btn = jsonxczInit(frame: frame)
        btn.setTitle(title, for: UIControlState.normal)
        btn.backgroundColor = backgroundColor
        return btn
    }
}

