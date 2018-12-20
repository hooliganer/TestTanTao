////
////  EntityDB.swift
////  TestTanTao
////
////  Created by tantao on 2018/12/12.
////  Copyright © 2018 tantao. All rights reserved.
////
//
//import Foundation
//import CoreData
//
//extension Entity {
//    func toStruct() -> EntityStruct {
//        var ets = EntityStruct();
//        ets.e1 = self.e1;
//        ets.e2 = self.e2;
//        ets.e3 = self.e3;
//        ets.emailHash = self.emailHash;
//        ets.uuidHash = self.uuidHash;
//        return ets;
//    }
//}
//
//struct EntityStruct {
//    var e1: String?
//    var e2: NSDecimalNumber?
//    var e3: Data?
//    var emailHash: String?
//    var uuidHash: String?
//    
//    func save() {
//        CoredataManager.shared.save(entity: self);
//    }
//    
//    
//    static func getAll() -> [EntityStruct] {
//        let etts = CoredataManager.shared.getAll();
//        var etss : [EntityStruct] = [];
//        for ett in etts {
//            etss.append(ett.toStruct());
//        }
//        return etss;
//    }
//    
//    func updateE3(value:Data?,emailHash: String?, uuidHash: String?,block:(_ info:String,_ suc:Bool) -> Void) {
//        CoredataManager.shared.modifyBy(emailHash: emailHash, uuidHash: uuidHash, key: "e3", value: value, block: block);
//    }
//}
//
//extension CoredataManager {
//    
//    func save(entity:EntityStruct) {
//        
//        let ett = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: self.context) as! Entity
//        ett.e1 = entity.e1;
//        ett.e2 = entity.e2;
//        ett.e3 = entity.e3;
//        ett.emailHash = entity.emailHash;
//        ett.uuidHash = entity.uuidHash;
//        
//        self.saveContext();
//    }
//    
//    func getAll() -> [Entity] {
//        let fetchRequest: NSFetchRequest = Entity.fetchRequest()
//        do {
//            let result = try self.context.fetch(fetchRequest)
//            return result;
//        } catch {
//            fatalError()
//        }
//    }
//    
//    
//    func modifyBy(emailHash:String?,
//                  uuidHash:String?,
//                  key:String?,
//                  value:Any?,
//                  block:(_ desc:String,_ suc:Bool) -> Void) {
//        
//        guard let value = value,
//            let key = key,
//            let uuidHash = uuidHash,
//            let emailHash = emailHash else {
//                return ;
//        }
//        //创建查询请求
//        let fetchRequest : NSFetchRequest = Entity.fetchRequest();
//        fetchRequest.predicate = NSPredicate(format: "emailHash = %@ and uuidHash = %@", emailHash,uuidHash);
//        
//        do {
//            let results = try self.context.fetch(fetchRequest)
//            if results.count == 0 {
//                block("没有对应的数据，不更新! -- “\(emailHash)” “\(uuidHash)”",false);
//            }
//            for rs in results {
//                switch key {
//                case "e1":
//                    rs.e1 = value as? String;
//                case "e2":
//                    rs.e2 = value as? NSDecimalNumber;
//                case "e3":
//                    rs.e3 = value as? Data;
//                default: break
//                }
//            }
//            if self.context.hasChanges {
//                do {
//                    try self.context.save()
//                } catch {
//                    fatalError();
//                }
//            }
//        } catch {
//            fatalError();
//        }
//    }
//}
