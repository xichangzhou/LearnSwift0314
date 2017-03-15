//
//  BaseViewController.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/14.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let _ = self.setUINavigationBarWithBackFrontVC("icon_back")
        
        self.view.backgroundColor = UIColor.white
    }
}





