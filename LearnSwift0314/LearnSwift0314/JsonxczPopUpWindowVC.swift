//
//  JsonxczPopUpWindowVC.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/15.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

class JsonxczPopUpWindowVC: UIViewController {

    //这个是存放按钮的容器view
    var layView : UIView!
    
    //这个是容器view宽和高
    var layViewWidth : CGFloat!
    var layViewHeight : CGFloat!
    
    var buttonHeight : CGFloat = 40
    
    var cancleBtn : UIButton!
    
    /// 初始化PopUpWindowViewController
    ///
    /// - Parameter frame: frame的大小
    private func jsonxczInit(frame : CGRect){
        self.layViewWidth = frame.size.width
        self.layViewHeight = frame.size.height
        self.modalPresentationStyle = .overFullScreen
        self.view.backgroundColor = UIColor.clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        self.view.addGestureRecognizer(tap)
        layView = UIView(frame: frame)
        layView.backgroundColor = UIColor.gray
        self.view.addSubview(layView)
    }
    
    
    /// 初始化
    ///
    /// - Parameter frame: frame的大小
    init(frame : CGRect) {
        super.init(nibName: nil, bundle: nil)
        jsonxczInit(frame: frame)
    }
    
    init(frame:CGRect,backgroundColor:UIColor) {
        super.init(nibName: nil, bundle: nil)
        jsonxczInit(frame: frame)
        layView.backgroundColor = backgroundColor
    }
    
    init(frame:CGRect,backgroundColor:UIColor,radius:CGFloat) {
        super.init(nibName: nil, bundle: nil)
        jsonxczInit(frame: frame)
        layView.backgroundColor = backgroundColor
        layView.layer.masksToBounds = true
        layView.layer.cornerRadius = radius
        
        
    }
    
    func setCancleButtonCornerRadius(radius:CGFloat) -> JsonxczPopUpWindowVC {
        cancleBtn.layer.masksToBounds = true
        cancleBtn.layer.cornerRadius = radius
        return self
    }
    
    func addCancelButtonWithTitle(backgroundColor:UIColor,title : String) -> JsonxczPopUpWindowVC {
        cancleBtn = UIButton.jsonxczInit(frame: CGRect(x: 0, y: layViewHeight - buttonHeight, width: layViewWidth, height: buttonHeight), title: title, backgroundColor: backgroundColor)
        layView.addSubview(cancleBtn)
        return self
    }
    
    
    
    func tap() {
        self.dismiss(animated: true, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
