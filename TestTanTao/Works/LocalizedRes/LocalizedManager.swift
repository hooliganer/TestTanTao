//
//  LocalizedManager.swift
//  TestTanTao
//
//  Created by tantao on 2018/11/29.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class LocalizedManager: NSObject {
    
    class func printDictionary(directory:String) {
        
        //1. 本地获取XML，并转化为NSData类型
        guard let path = Bundle.main.path(forResource: "strings", ofType: "xml", inDirectory: directory) else {
            print("\n path为空! \n")
            return ;
        }
        let url = NSURL.fileURL(withPath: path);
        let data = NSData.init(contentsOf: url);
        //2. 开始转化
        do {
            let dic = try XMLReader.dictionary(forXMLData: (data! as Data), options: UInt(XMLReaderOptionsProcessNamespaces))
            
            //3. 打印出来之后，自己字典转模型
            let dict = dic.values.first as! NSDictionary
            // [string, string-array, text]
            let stringArr = dict["string"] as! NSArray;
            
            let mdic : NSMutableDictionary = NSMutableDictionary();
            
            for objc in stringArr {
                
                let dicName = (objc as! NSDictionary);
                if dicName["text"] != nil {
                    mdic.setValue("\(dicName["text"]!)", forKey: "\(dicName["name"]!)")
                } else {
                    for key in dicName.allKeys {
                        if dicName[key] is NSDictionary {
                            mdic.setValue("\((dicName[key] as! NSDictionary)["text"]!)", forKey: "\(dicName["name"]!)");
                        }
                    }
                }
                
            }
//            print(mdic)
            for key in mdic.allKeys {
                let keystr:String = key as! String
                print("\"\(keystr)\" = \"\(mdic.value(forKey: keystr) ?? "")\";")
            }
            
        } catch let error as NSError {
            print("\n \(error.description) \n")
        }
        
    }
    
    
    
    class func printKeyValue1(directory:String) {
        //1. 本地获取XML，并转化为NSData类型
        guard let path = Bundle.main.path(forResource: "strings", ofType: "xml", inDirectory: directory) else {
            print("\n path为空! \n")
            return ;
        }
        let url = NSURL.fileURL(withPath: path);
        let data = NSData.init(contentsOf: url);
        //2. 开始转化
        do {
            let dic = try XMLReader.dictionary(forXMLData: (data! as Data), options: UInt(XMLReaderOptionsProcessNamespaces))
            //3. 打印出来之后，自己字典转模型
            let dict = dic.values.first as! NSDictionary
            // [string, string-array, text]
            let stringArr = dict["string"] as! NSArray;
            for objc in stringArr {
                let dicName = (objc as! NSDictionary);
                if dicName["text"] != nil {
                    
                    print("\"\(dicName["name"]!)\" = \"\(dicName["text"]!)\";")
                } else {
                    
                    var string = "\"\(dicName["name"]!)\" = "
                    for key in dicName.allKeys {
                        if dicName[key] is NSDictionary {
                            string.append("\"\((dicName[key] as! NSDictionary)["text"]!)\";")
                        }
                    }
                    print(string)
                }
            }
            
        } catch let error as NSError {
            print("\n \(error.description) \n")
        }
    }
    
    class func printKeyValue(directory:String) {
        //1. 本地获取XML，并转化为NSData类型
        guard let path = Bundle.main.path(forResource: "strings", ofType: "xml", inDirectory: directory) else {
            print("\n path为空! \n")
            return ;
        }
        let url = NSURL.fileURL(withPath: path);
        let data = NSData.init(contentsOf: url);
        //2. 开始转化
        do {
            let dic = try XMLReader.dictionary(forXMLData: (data! as Data))
            //3. 打印出来之后，自己字典转模型
            let dict = dic.values.first as! NSDictionary
            // [string, string-array, text]
            let stringArr = dict["string"] as! NSArray;
            for objc in stringArr {
                let dicName = (objc as! NSDictionary);
                if dicName["text"] != nil {
                    print("\"\(dicName["name"]!)\" = \"\(dicName["text"]!)\";")
                } else {
                    
                    var string = "\"\(dicName["name"]!)\" = "
                    for key in dicName.allKeys {
                        if dicName[key] is NSDictionary {
                            string.append("\"\((dicName[key] as! NSDictionary)["text"]!)\";")
                        }
                    }
                    print(string)
                }
            }
            
        } catch let error as NSError {
            print("\n \(error.description) \n")
        }
    }
}
