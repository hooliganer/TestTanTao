//
//  CoredataManager.swift
//  TestTanTao
//
//  Created by tantao on 2018/11/26.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit
import CoreData


class CoredataManager: NSObject {

    static let shared = CoredataManager();
    
    // 拿到AppDelegate中创建好了的NSManagedObjectContext
    lazy var context: NSManagedObjectContext = {
        let context = (UIApplication.shared.delegate as! AppDelegate).context;
        return context
    }()
    
    /// 更新数据
    func saveContext() {
        do {
            try context.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    
}
