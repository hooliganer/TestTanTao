//
//  MyFileManager.swift
//  TestTanTao
//
//  Created by tantao on 2018/11/20.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class MyFileManager: NSObject {
    
    static let shared = MyFileManager();
    
    /// 取得文件所使用的路径
    ///
    /// - Returns: 路径
    func DocumentPath() -> String? {
        
        let urls = FileManager.default.urls(for: FileManager.SearchPathDirectory.libraryDirectory, in: FileManager.SearchPathDomainMask.userDomainMask);
        guard let path = urls.first?.path else {
            print("\n 出错！没有取得本地路径！ \n")
            return nil;
        }
        let newPath = (path as NSString).appendingPathComponent("");
        
//        let newPath = NSHomeDirectory();
        
        return newPath;
    }
    
    /// 判断文件(夹)是否存在
    ///
    /// - Parameter name: 文件(夹)名称
    /// - Returns: 是否存在
    func existDocument(name:String) -> Bool {
        
        let fileManager = FileManager.default
        guard let path = self.DocumentPath() else { return false }
        let filePath:String = path + "/\(name)";
        let exist = fileManager.fileExists(atPath: filePath)
    
        return exist;
    }
    
    /// 创建文件夹
    ///
    /// - Parameter name: 文件夹名
    func createFolder(name:String) {
        
        guard !self.existDocument(name: name) else {
            print("\n 创建”\(name)“失败！已存在！ \n")
            return ;
        }
        guard let newPath = self.DocumentPath() else {
            return ;
        }
        do {
            try FileManager.default.createDirectory(atPath: "\(newPath)/\(name)", withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print("\n 创建文件夹出错：\(error.localizedDescription) \n")
        }
        
    }
    
    /// 创建文件
    ///
    /// - Parameters:
    ///   - name: 文件名及其后缀
    ///   - folder: 文件夹名称（如有多层级，需自己拼接路径）
    func createFile(name:String,in folder:String) {
        
        if !self.existDocument(name: folder) {
            self.createFolder(name: folder);
        }
        guard !self.existDocument(name: "\(folder)/\(name)") else {
            print("\n 文件”\(name)“已存在于文件夹”\(folder)“！ \n")
            return ;
        }
        
        guard var newPath = self.DocumentPath() else {
            return ;
        }
        newPath.append("/\(folder)/\(name)");
        do {
            try FileManager.default.createDirectory(atPath: newPath, withIntermediateDirectories: true, attributes: nil)
        } catch let error {
            print("\n 创建文件夹出错：\(error.localizedDescription) \n")
        }
        
    }
    
    
    func readFile(name:String,folder:String) {
        
//        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true);
        
        
        
    }
    
    

//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    NSString * path = [NSString stringWithFormat:@"%@/%@",documentsDirectory,fileName];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    BOOL isDir;
//    if  (![fileManager fileExistsAtPath:path isDirectory:&isDir]) {//先判断目录是否存在，不存在才创建
//    BOOL res=[fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
//    return res;
    

}

