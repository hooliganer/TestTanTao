//
//  ViewController.swift
//  TestTanTao
//
//  Created by tantao on 2018/11/20.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    lazy var tabler: UITableView = {
        let view = UITableView(frame: CGRect(x: 10, y: NavigationHeight, width: MainScreenWidth - 20, height: MainScreenHeight - NavigationHeight), style: .plain)
        self.view.addSubview(view)
        return view
    }()
    lazy var datasources: [MainModel] = {
        let arr = [
            MainModel(name: "RxSwift", controller: RxSwiftController()),
            MainModel(name: "Webview", controller: WebMainController())
        ]
        return arr
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.title = "主界面"
        self.tabler.dataSource = self
        self.tabler.delegate = self
        self.tabler.backgroundColor = .clear
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.datasources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifer = "MainCellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifer)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: identifer)
            cell?.backgroundColor = .clear
            if #available(iOS 8.2, *) {
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            } else {
                cell?.textLabel?.font = UIFont.systemFont(ofSize: 20)
            }
        }
        cell?.textLabel?.text = self.datasources[indexPath.row].name
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.datasources[indexPath.row].controller
        self.navigationController?.pushViewController(controller!, animated: true)
//        self.present(controller!, animated: true, completion: nil)
    }
}

class MainModel: NSObject {
    var controller : UIViewController?
    var name : String?
    convenience init(name:String,controller:UIViewController) {
        self.init()
        self.controller = controller
        self.name = name
    }
}
