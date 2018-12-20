//
//  LoadViewController.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/18.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class LoadViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate {
    
    

    @IBOutlet var MainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.MainTable.dataSource = self;
        self.MainTable.delegate = self;
        
//        guard let url = URL(string: "https://www.baidu.com") else {
//            return ;
//        };
//        let request = URLRequest(url: url)
//
//        let weber = UIWebView.init(frame: CGRect.init(x: 0, y: 100, width: 400, height: 400));
//        self.view.addSubview(weber);
//        weber.loadRequest(request)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseIdentifer = "cellID";
        var cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifer) as? WebTableCell;
        if cell == nil {
            cell = Bundle.main.loadNibNamed("WebTableCell", owner: nil, options: nil)?.last as? WebTableCell;
            cell?.backgroundColor = UIColor.orange;
            cell?.WebView.delegate = self;
        }
        
//        // 自动检测电话号码、网址、邮件地址
//        self.webView.dataDetectorTypes = UIDataDetectorTypePhoneNumber;
//        // 缩放网页
        
        guard let url = URL(string: "https://www.baidu.com") else {
            return cell!;
        };
        let request = URLRequest(url: url)
        
        cell?.WebView.loadRequest(request);
        
        return cell!;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250;
    }
    
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebView.NavigationType) -> Bool {
        
        print("\n \(webView) \n")
        
        return true;
    }

}
