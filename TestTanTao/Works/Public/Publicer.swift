//
//  Publicer.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/10.
//  Copyright © 2018 tantao. All rights reserved.
//

import Foundation
import UIKit

func ShowAlert(controller title:String,message:String ) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
    let title = "OK";
    let btnOK = UIAlertAction(title: title, style: .default, handler: {
        action in
        let vc:UIViewController = CurrentController()
        vc.navigationController?.popToRootViewController(animated: true)
        print("点击了OK")
    })
    alert.addAction(btnOK)
    UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil)
    
}

/// 当前页面
///
/// - Returns: 当前controller
func CurrentController() -> UIViewController {
    
    let rootController = UIApplication.shared.keyWindow?.rootViewController;
    let curController = getCurControllerFromVC(rootVC: rootController!)
    return curController!;
}

private func getCurControllerFromVC(rootVC:UIViewController) -> UIViewController? {
    
    let curVC : UIViewController?
    var newRootVC = rootVC;
    if rootVC.presentedViewController != nil {
        newRootVC = rootVC.presentedViewController!;
    }
    if newRootVC is UITabBarController {
        curVC = getCurControllerFromVC(rootVC: (newRootVC as! UITabBarController).selectedViewController!)
    } else if newRootVC is UINavigationController {
        curVC = getCurControllerFromVC(rootVC: (newRootVC as! UINavigationController).visibleViewController!)
    } else {
        curVC = newRootVC;
    }
    
    return curVC;
}
