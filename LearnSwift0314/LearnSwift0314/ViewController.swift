//
//  ViewController.swift
//  LearnSwift0314
//
//  Created by xcz on 2017/3/14.
//  Copyright © 2017年 xcz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    var tableView : UITableView!
    
    var datas:[String] = {
        var datas:[String] = ["创建UIButton"]
        return datas
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initTableView()
        
    }
    
    func initTableView() {
        tableView = initTableView(frame: CGRect(x: 0, y: 0, width: Common.screenWidth, height: Common.screenHeight))
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = datas[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let createButtonVC = CreateButtonViewController()
            self.navigationController?.pushViewController(createButtonVC, animated: true)
        }
    }
}
