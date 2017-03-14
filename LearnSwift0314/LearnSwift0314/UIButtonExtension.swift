//
//  UIButtonExtension.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/14.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

extension UIButton {
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
    
    func jsonxczInit(frame:CGRect) -> UIButton{
        let btn = UIButton(frame: frame)
        btn.backgroundColor = UIColor.red
        return btn
    }
    
    func jsonxczInit(frame:CGRect,backgroundColor:UIColor) -> UIButton{
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        return btn
    }
    
    func jsonxczInit(frame:CGRect,backgroundColor:UIColor,action:Selector, target:Any) -> UIButton{
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        btn.addTarget(target, action: action, for: UIControlEvents.touchUpInside)
        return btn
    }
    
    func jsonxczInit(frame:CGRect,backgroundColor:UIColor,title:String,textColor:UIColor) -> UIButton{
        let btn = jsonxczInit(frame: frame)
        btn.backgroundColor = backgroundColor
        btn.setTitle(title, for: UIControlState.normal)
        btn.titleLabel!.textColor = textColor
        return btn
    }
    
    func jsonxczInit(frame:CGRect,title:String) -> UIButton {
        let btn = jsonxczInit(frame: frame)
        btn.setTitle(title, for: UIControlState.normal)
        return btn
    }
    
    func jsonxczInit(frame:CGRect,title:String,backgroundColor:UIColor) -> UIButton {
        let btn = jsonxczInit(frame: frame)
        btn.setTitle(title, for: UIControlState.normal)
        btn.backgroundColor = backgroundColor
        return btn
    }
}

