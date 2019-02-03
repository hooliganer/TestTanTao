//
//  WebMainController.swift
//  TestTanTao
//
//  Created by tantao on 02/02/2019.
//  Copyright © 2019 tantao. All rights reserved.
//

import UIKit
import JavaScriptCore

class WebMainController: UIViewController,UIWebViewDelegate {

    var mainWebview = UIWebView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 创建一个远程URL
        let url = URL(string: "https://www.baidu.com")
        // 创建Request
        let request = URLRequest(url: url!)
        self.mainWebview.loadRequest(request)
//        self.mainWebview.backgroundColor = .red
        if #available(iOS 11.0, *) {
            self.mainWebview.scrollView.contentInsetAdjustmentBehavior = .never
        }
        self.mainWebview.frame = CGRect(x: 0, y: NavigationHeight, width: MainScreenWidth, height: MainScreenHeight - NavigationHeight)
        self.mainWebview.delegate = self
        self.view.addSubview(self.mainWebview)
        print(self.view.frame)
    }
    
    // MARK: Webview Delegate
    func webViewDidFinishLoad(_ webView: UIWebView) {
        //! 获取JS代码的执行环境/上下文/作用域
        let context = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        
        //! 监听JS代码里面的jsToOc方法（执行效果上可以理解成重写了JS的jsToOc方法）
        let block = context.evaluateScript("jsToOc")
        
//        context[@"jsToOc"] = ^(NSString *action, NSString *params) {
//            dispatch_async(dispatch_get_main_queue(), ^{
//                [UIWebViewJavaScriptCoreController showAlertWithTitle:action message:params cancelHandler:nil];
//                });
//        };
    }

}
