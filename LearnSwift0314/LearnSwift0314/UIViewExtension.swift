//
//  UIViewExtension.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/15.
//  Copyright © 2017年 xcz. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    //将子视图添加到父视图中
    func jsonxczAddViewToSupView(supView:UIView,subView:UIView) -> UIView{
        supView.addSubview(subView)
        return self
    }
    
    //将子视图添加到父视图中
    func jsonxczAddViewToSupView(supView:UIView) -> UIView{
        supView.addSubview(self)
        return self
    }
    
    
    /// 初始化view
    ///
    /// - Parameter frame: view的frame
    /// - Returns: 返回view
    class func jsonxczInit(frame:CGRect) -> UIView{
        let view = UIView(frame: frame)
        return view
    }
    
    /// 初始化view
    ///
    /// - Parameters:
    ///   - frame: view的frame
    ///   - backgroundColor: view背景颜色
    /// - Returns: 返回view
    class func jsonxczInit(frame:CGRect,backgroundColor:UIColor) -> UIView{
        let view = jsonxczInit(frame: frame)
        view.backgroundColor = backgroundColor
        return view
    }
    
    
    /// 初始化view
    ///
    /// - Parameters:
    ///   - frame: view的frame
    ///   - backgroundColor: view背景颜色
    ///   - radius: view圆角大小
    /// - Returns: 返回view
    class func jsonxczInit(frame:CGRect,backgroundColor:UIColor,radius:CGFloat) -> UIView{
        let view = jsonxczInit(frame: frame)
        view.backgroundColor = backgroundColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = radius
        return view
    }
    
    //返回该view所在VC
    func firstViewController() -> UIViewController? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let responder = view?.next {
                if responder.isKind(of: UIViewController.self){
                    return responder as? UIViewController
                }
            }
        }
        return nil
    }
    
    //返回该view所在的父view
    func superView<T: UIView>(of: T.Type) -> T? {
        for view in sequence(first: self.superview, next: { $0?.superview }) {
            if let father = view as? T {
                return father
            }
        }
        return nil
    }
    
    
}
