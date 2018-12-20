//
//  WalletDB.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/12.
//  Copyright © 2018 tantao. All rights reserved.
//

import Foundation
import CoreData

extension Wallet {
    func toSttruc() -> WalletStruct {
        var ws = WalletStruct();
        ws.emailHash = self.emailHash;
        ws.more = self.more;
        ws.name = self.name;
        ws.token = self.token;
        ws.uuidHash = self.uuidHash;
        return ws;
    }
    
    class func select(emailHash:String?,uuidHash:String?) -> Wallet? {
        let ws = CoredataManager.shared.select(emailHash: emailHash, uuidHash: uuidHash);
        return ws?.first;
    }
}

struct WalletStruct {
    var emailHash: String?
    var more: String?
    var name: String?
    var token: String?
    var uuidHash: String?
    
    func save() {
        CoredataManager.shared.add(wallet: self);
    }
    
    func isExist() -> Bool {
        let ws = CoredataManager.shared.select(emailHash: self.emailHash, uuidHash: self.uuidHash);
        if (ws != nil) {
            if (ws?.count)! > 0 {
                return true;
            }
        }
        return false;
    }
    
    func delete() {
        CoredataManager.shared.delete(emailHash: self.emailHash, uuidHash: self.uuidHash);
    }
    
    func update() {
        CoredataManager.shared.modify(wallet: self);
    }
    
}

extension CoredataManager {
    
    func add(wallet:WalletStruct) {
        
        let objc = NSEntityDescription.insertNewObject(forEntityName: "Wallet", into: self.context) as! Wallet
        objc.emailHash = wallet.emailHash;
        objc.uuidHash = wallet.uuidHash;
        objc.name = wallet.name;
        objc.more = wallet.more;
        objc.token = wallet.token;
        
        self.saveContext();
    }
    
    func select(emailHash:String?,uuidHash:String?) -> [Wallet]? {
        guard let emailhash = emailHash,let uuidhash = uuidHash else {
            print("\n can`t select nil email or uuid ! \n")
            return nil;
        }
        //创建查询请求
        let fetchRequest : NSFetchRequest = Wallet.fetchRequest();
        fetchRequest.predicate = NSPredicate(format: "emailHash = %@ and uuidHash = %@", emailhash,uuidhash);
        do {
            let result = try self.context.fetch(fetchRequest)
            return result;
        } catch {
            fatalError()
        }
    }
    
    func readAll() -> [Wallet] {
        let fetchRequest: NSFetchRequest = Wallet.fetchRequest()
        do {
            let result = try self.context.fetch(fetchRequest)
            return result;
        } catch {
            fatalError()
        }
    }
    
    func delete(emailHash:String?,uuidHash:String?) {
        guard let emailHash = emailHash else {
            print("\n 不能删除这个，因为emailHash为空 \n")
            return ;
        }
        guard let uuidHash = uuidHash else {
            print("\n 不能删除这个，因为uuidHash为空 \n")
            return ;
        }
        let fetchRequest: NSFetchRequest = Wallet.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "emailHash == %@ and uuidHash == %@", emailHash,uuidHash)
        do {
            let result = try context.fetch(fetchRequest)
            for rs in result {
                context.delete(rs)
            }
        } catch {
            fatalError()
        }
        saveContext()
    }
    
    func modify(wallet:WalletStruct) {
        
        guard let emailhash = wallet.emailHash,let uuidhash = wallet.uuidHash else {
            print("\n can`t select nil email or uuid ! \n")
            return ;
        }
        //创建查询请求
        let fetchRequest : NSFetchRequest = Wallet.fetchRequest();
        fetchRequest.predicate = NSPredicate(format: "emailHash = %@ and uuidHash = %@", emailhash,uuidhash);
        do {
            let result = try self.context.fetch(fetchRequest)
            for rs in result {
                rs.name = wallet.name;
                rs.more = wallet.more;
                rs.name = wallet.name;
                rs.token = wallet.token;
            }
        } catch {
            fatalError()
        }
    }
}
