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
        let _ = UIButton.jsonxczInit(frame: CGRect(x: 40, y: 200, width: 200, height: 40)).jsonxczAddViewToSupView(supView: self.view).jsonxczSetbackgroundColor(backgroundColor: UIColor.red).jsonxczSetTitle(title: "fasd").jsonxczAddTarget(for: UIControlEvents.touchUpInside) { (btn) in
            print(".语法成功\(btn.backgroundColor)")
            self.showPopUpVC(frame: CGRect(x: 40, y: 600, width: 400, height: 100), backgroundColor: UIColor.red)
        }.jsonxczSetCornerRadius(radius: 5)
        
        
    }
}
