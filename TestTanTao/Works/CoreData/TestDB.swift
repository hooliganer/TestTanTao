//
//  TestDB.swift
//  TestTanTao
//
//  Created by tantao on 2019/1/9.
//  Copyright © 2019 tantao. All rights reserved.
//

import Foundation

extension Test {
    
    class func newTest() -> Test {
        let objc = NSEntityDescription.insertNewObject(forEntityName: "Test", into: CoredataManager.shared.context) as! Test
        return objc
    }
    
    func insert() {
        CoredataManager.shared.saveContext();
    }
    
    /// 清空所有Test数据
    class func clean() {
        let fetchRequest: NSFetchRequest = Test.fetchRequest()
        do {
            let result = try CoredataManager.shared.context.fetch(fetchRequest)
            for rs in result {
                CoredataManager.shared.context.delete(rs)
            }
        } catch {
            fatalError()
        }
        CoredataManager.shared.saveContext()
    }
    
    class func readAll() -> [Test] {
        let fetchRequest: NSFetchRequest = Test.fetchRequest()
        do {
            let result = try CoredataManager.shared.context.fetch(fetchRequest)
            return result;
        } catch {
            fatalError()
        }
    }
    
    class func logAll() {
        let fetchRequest: NSFetchRequest = Test.fetchRequest()
        do {
            let result = try CoredataManager.shared.context.fetch(fetchRequest)
            for item in result {
                print("\n \(item) \n")
            }
        } catch {
            fatalError()
        }
    }
}
