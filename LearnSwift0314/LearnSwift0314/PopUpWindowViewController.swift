//
//  PopUpWindowViewController.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/14.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

class PopUpWindowViewController: UIViewController {

    //这个是存放按钮的容器view
    var layView : UIView = UIView()
    //这个是容器view宽和高
    private var width : CGFloat!
    private var height : CGFloat!
    init() {
        super.init(nibName: nil, bundle: nil)
        self.width = self.view.bounds.size.width / 2
        self.height = self.view.bounds.size.height / 2
        self.modalPresentationStyle = .overFullScreen
        self.view.backgroundColor = UIColor.clear
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        self.view.addGestureRecognizer(tap)
        
        layView.frame = CGRect(x: self.view.bounds.size.width / 2 - self.width / 2, y: self.view.bounds.size.height / 2 - self.height / 2, width: 600, height: 400)
        //layView.layer.masksToBounds = true
        //layView.layer.cornerRadius = 50
        layView.backgroundColor = UIColor.gray
        self.view.addSubview(layView)
    }
    
    init(frame : CGRect) {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .overFullScreen
        self.view.backgroundColor = UIColor.clear
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.tap))
        self.view.addGestureRecognizer(tap)
        layView.frame = frame
        layView.backgroundColor = UIColor.gray
        self.view.addSubview(layView)
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
