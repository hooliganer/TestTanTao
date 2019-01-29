//
//  SampleTask.swift
//  TestTanTao
//
//  Created by tantao on 2019/1/8.
//  Copyright © 2019 tantao. All rights reserved.
//

import UIKit
import Selene

class SampleTask: NSObject,SLNTaskProtocol {
    
    static func identifier() -> String! {
        return NSStringFromClass(self)
    }
    
    static func operation(completion: SLNTaskCompletion_t!) -> Operation! {
        let operation = BlockOperation.init {
            
            print("我就是传说中的Background Fetch💦")
            let localNoti = UILocalNotification()
            localNoti.hasAction = true;
            let actionMsgs = ["查看一个巨大的秘密","看看小伙伴在做什么","看美女图片","领取奖品","看看洪哥在做什么","掏钱买下一个DropBeacon","请世文吃饭"]
            localNoti.alertAction = actionMsgs[Int(arc4random()%UInt32(actionMsgs.count))]
            localNoti.alertBody = "我就是传说中的Background Fetch💦"
            UIApplication.shared.scheduleLocalNotification(localNoti)
            
        }
        return operation
    }
    
    static func averageResponseTime() -> CGFloat {
        return 5.0
    }
    
    static func priority() -> SLNTaskPriority {
        return SLNTaskPriority.low
    }
    
    
}
