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



extension UIViewController {
    //自定义UINavigationBar，返回一个backgroundContainerView
    func setUINavigationBar() -> UIView {
        self.navigationController?.navigationBar.isHidden = true
        let navigationBar : UINavigationBar = UINavigationBar()
        self.view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.left.equalTo(0)
            make.height.equalTo(Common.navigationBarHeight)
        }
        let backgroundContainerView = UIView()
        backgroundContainerView.backgroundColor = UIColor(red: 12/255, green: 56/255, blue: 71/255, alpha: 1)
        navigationBar.addSubview(backgroundContainerView)
        backgroundContainerView.snp.makeConstraints { (make) in
            make.size.equalTo(navigationBar)
        }
        return backgroundContainerView
    }
    //自定义UINavigationBar，拥有一个参数backBtnImage：退回前一个界面的icon名字，返回一个backBtn，和一个backgroundContainerView
    func setUINavigationBar(_ backBtnImage : String) -> (UIButton,UIView){
        let navigationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height: Common.navigationBarHeight))
        self.view.addSubview(navigationBar)
        let backgroundContainerView = UIView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height: navigationBar.frame.size.height))
        backgroundContainerView.backgroundColor = UIColor(red: 12/255, green: 56/255, blue: 71/255, alpha: 1)
        
        let backBtn:UIButton = UIButton(frame: CGRect(x: 0,y: 41,width: 52,height: 41))
        backBtn.setImage(UIImage(named: backBtnImage), for: UIControlState())
        backBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        backgroundContainerView.addSubview(backBtn)
        navigationBar.addSubview(backgroundContainerView)
        return (backBtn,backgroundContainerView)
    }
    
    func setUINavigationBarWithBackFrontVC(_ backBtnImage : String) -> (UIButton,UIView){
        
        let navigationBar : UINavigationBar = UINavigationBar()
        self.view.addSubview(navigationBar)
        navigationBar.snp.makeConstraints { (make) in
            make.top.equalTo(0)
            make.right.left.equalTo(0)
            make.height.equalTo(Common.navigationBarHeight)
        }
        let backgroundContainerView = UIView()
        backgroundContainerView.backgroundColor = UIColor(red: 12/255, green: 56/255, blue: 71/255, alpha: 1)
        navigationBar.addSubview(backgroundContainerView)
        backgroundContainerView.snp.makeConstraints { (make) in
            make.size.equalTo(navigationBar)
        }
        
        let backBtn:UIButton = UIButton(frame: CGRect(x: 0,y: 41,width: 52,height: 41))
        backBtn.setImage(UIImage(named: backBtnImage), for: UIControlState())
        backBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        
        backBtn.addTarget(self, action: #selector(UIViewController.backVC), for: UIControlEvents.touchUpInside)
        backgroundContainerView.addSubview(backBtn)
        
        return (backBtn,backgroundContainerView)
        
    }
    
    func setUINavigationBarWithBackRootVC(_ backBtnImage : String) -> (UIButton,UIView){
        let navigationBar : UINavigationBar = UINavigationBar(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height: Common.navigationBarHeight))
        self.view.addSubview(navigationBar)
        let backgroundContainerView = UIView(frame: CGRect(x: 0,y: 0,width: UIScreen.main.bounds.width,height: navigationBar.frame.size.height))
        backgroundContainerView.backgroundColor = UIColor(red: 12/255, green: 56/255, blue: 71/255, alpha: 1)
        let backBtn:UIButton = UIButton(frame: CGRect(x: 0,y: 41,width: 52,height: 41))
        
        backBtn.setImage(UIImage(named: backBtnImage), for: UIControlState())
        backBtn.imageView?.contentMode = UIViewContentMode.scaleAspectFit
        backBtn.addTarget(self, action: #selector(UIViewController.backRootVC), for: UIControlEvents.touchUpInside)
        backgroundContainerView.addSubview(backBtn)
        navigationBar.addSubview(backgroundContainerView)
        return (backBtn,backgroundContainerView)
    }
    
    //返回前一个界面
    func backVC() {
        let _ = self.navigationController?.popViewController(animated: true)
    }
    
    //返回到UINavigationVC的第一个界面
    func backRootVC() {
        let _ = self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    func showPopUpVC(image:UIImage) {
        let popUpVC = PopUpWindowViewController(frame: CGRect(x: self.view.frame.size.width / 2 - 200 / 2, y: self.view.frame.size.height / 2 - 200 / 2, width: 200, height: 200))
        let layView = popUpVC.layView
        layView.backgroundColor = UIColor.red
        let imageView = UIImageView()
        imageView.image = image
        layView.addSubview(imageView)
        imageView.snp.makeConstraints({ (make) in
            make.center.equalTo(layView)
            make.width.height.equalTo(30)
        })
        present(popUpVC, animated: true, completion: nil)
    }
    
    //显示消息
    func showAlert(message:String){
        let alertController = UIAlertController(title: "",message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "确定", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // 打印元素
    func printElementFromArray<t>(a: [t]) {
        for element in a {
            print(element)
        }
    }
    
    func initTableView(frame:CGRect) -> UITableView{
        let tableView = UITableView(frame: frame)
        tableView.backgroundColor = UIColor.white
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        self.view.addSubview(tableView)
        return tableView
    }
    
    //初始化gradientLayer并设置相关属性
    func createGradientLayer(frame:CGRect,colors:[CGColor],locations:[NSNumber],startPoint:CGPoint,endPoint:CGPoint) -> CAGradientLayer{
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        //设置渐变的主颜色
        gradientLayer.colors = colors
        gradientLayer.locations = locations
        //此处point位置为左上角为0，左下角为1，右上角为0，右下角为1
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        return gradientLayer
    }
    
}

extension UIView {
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


