//
//  SLNTestTask.swift
//  TestTanTao
//
//  Created by tantao on 2019/1/7.
//  Copyright © 2019 tantao. All rights reserved.
//

import UIKit
import Selene

class SLNTestTask: NSObject,SLNTaskProtocol {
    
    public func start() {
        let arr = [SLNTestTask.classForCoder()]
        SLNScheduler.setMinimumBackgroundFetchInterval(5);
        SLNScheduler.scheduleTasks(arr);
    }
    
    static func identifier() -> String! {
        return NSStringFromClass(self);
    }
    
    static func operation(completion: SLNTaskCompletion_t!) -> Operation! {
        let queue = BlockOperation.init {
            let ws = WalletStruct.init(emailHash: "aaa", more: "bbb", name: "ccc", token: "ddd", uuidHash: "eee");
            ws.save();
        }
        return queue;
    }
    
    static func averageResponseTime() -> CGFloat {
        return 5.0;
    }
    
    static func priority() -> SLNTaskPriority {
        return SLNTaskPriority.low;
    }
    

}
