//
//  CreateButtonViewController.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/14.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

class CreateButtonViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let a = UIButton().jsonxczInit(frame: CGRect(x: 40, y: 200, width: 100, height: 10))
        let _ = a.jsonxczSetbackgroundColor(backgroundColor: UIColor.red).jsonxczSetTitle(title: "fasd")
        
        
        addViewToSupView(supView: self.view, subView: a)
    }
    
    func addViewToSupView(supView:UIView,subView:UIView) {
        supView.addSubview(subView)
    }
}

