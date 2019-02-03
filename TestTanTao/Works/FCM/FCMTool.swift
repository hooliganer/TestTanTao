//
//  FCMTool.swift
//  TestTanTao
//
//  Created by tantao on 30/01/2019.
//  Copyright © 2019 tantao. All rights reserved.
//

import UIKit

class FCMTool: NSObject {
    
    /// 判断推送是否开启
    ///
    /// - Returns: 是否开启
    class func isAllowNotification() -> Bool {
        let setting = UIApplication.shared.currentUserNotificationSettings
        if setting?.types != UIUserNotificationType.init(rawValue: 0) {
            return true
        }
        return false
    }
    
    /// 跳转设置通知界面
    func toNotificationSetting() {
        
        guard let url = URL(string: UIApplication.openSettingsURLString) else{
            return
        }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.openURL(url)
        }
    }
}
