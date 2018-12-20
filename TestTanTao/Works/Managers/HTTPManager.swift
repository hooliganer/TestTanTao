//
//  HTTPManager.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/14.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class HTTPManager: NSObject {
    
    static var shared = HTTPManager();
    
    var didGetData : ((Data) -> Void)?
    var didGetError : ((Error) -> Void)?
    
    var param : [String:Any]?
    
    
    func post(urlstring:String){

        let url = URL(string: urlstring)

        var request = URLRequest(url: url!)
        let list  = NSMutableArray()
        guard let paramDic = self.param else {
            return ;
        }
        if paramDic.count > 0 {

            //设置为POST请求
            request.httpMethod = "GET"

            //拆分字典,subDic是其中一项，将key与value变成字符串
            for subDic in paramDic {
                let tmpStr = "\(subDic.0)=\(subDic.1)"
                list.add(tmpStr)
            }

            //用&拼接变成字符串的字典各项
            let paramStr = list.componentsJoined(by: "&")

            //UTF8转码，防止汉字符号引起的非法网址
            let paraData = paramStr.data(using: String.Encoding.utf8)

            //设置请求体
            request.httpBody = paraData
        }
        let configuration:URLSessionConfiguration = URLSessionConfiguration.default
        let session:URLSession = URLSession(configuration: configuration)

        let task:URLSessionDataTask = session.dataTask(with: request) { (data, response, error)->Void in
            
            if error == nil{
                do{
                    let responseData:NSDictionary = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                    print("response:\(response)")
                    print("responseData:\(responseData)")
                }catch{
                    print("catch")
                }
            }else{
                print("error:\(error)")
            }

        }

        // 启动任务
        task.resume()

    }
    
    func newPost(url:URL,
                 success:@escaping((_ data:Data) -> Void),
                 fail:@escaping((_ error:Error) -> Void)) {
        
        var request = URLRequest(url: url, cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy, timeoutInterval: 30);
        request.httpMethod = "POST";
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.addValue("value", forHTTPHeaderField: "custom")
        
        if self.param != nil {
            var strs : [String] = [];
            for item in self.param! {
                strs.append("\(item.key)=\(item.value)")
            }
            let string = strs.joined(separator: "&")
            let data = string.data(using: String.Encoding.utf8);
            guard data != nil else {
                print("\n param 转 data 为空！不继续请求! \n")
                return ;
            }
            request.httpBody = data!;
        }
        
        let session = URLSession.shared;
        let dataTask = session.dataTask(with: request) { (resData, response, resError) in
            if resError != nil {
                fail(resError!);
                return ;
            }
            if resData != nil {
                success(resData!);
            }
        }
        dataTask.resume();
        
    }
    
    func post(url:URL,
              success:@escaping((_ data:Data) -> Void),
              fail:@escaping((_ error:Error) -> Void)) {
        
        var request = URLRequest(url: url);
        request.httpMethod = "GET";
        if self.param != nil {
            
            var strs : [String] = [];
            for item in self.param! {
                strs.append("\(item.key)=\(item.value)")
            }
            let string = strs.joined(separator: "&")
            let data = string.data(using: String.Encoding.utf8);
            
            guard data != nil else {
                print("\n param 转 data 为空！不继续请求! \n")
                return ;
            }
            request.httpBody = data!;
        }
        
//        let session = URLSession.shared;
        let configuration = URLSessionConfiguration.default;
        let session = URLSession(configuration: configuration);
        
        let dataTask = session.dataTask(with: request) { (dataer, response, error) in
            
            if error != nil {
                fail(error!);
                return ;
            }
            if dataer != nil {
                
                let ss = String(data: dataer!, encoding: String.Encoding.utf8)
                
                success(dataer!);
            }
            
        }
        dataTask.resume();
        
    }
    
    func post(url:URL) {
        
        let session = URLSession.shared;
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        if self.param != nil {
            var data : Data?
            do {
                data = try JSONSerialization.data(withJSONObject: self.param!, options: JSONSerialization.WritingOptions.prettyPrinted)
            } catch {
                fatalError();
            }
            guard data != nil else {
                return ;
            }
            request.httpBody = data!;
        }
        
        let dataTask = session.dataTask(with: request) { [weak self] (dataer, response, error) in
            
            guard let strongSelf = self else { return }
            if error != nil {
                strongSelf.didGetError?(error!);
                return ;
            }
            if dataer != nil {
                strongSelf.didGetData?(dataer!);
                return ;
            }
            
        }
        dataTask.resume();
    }
    
    func testPost(urlString:String,param:Dictionary<String, Any>) {
        
        let session = URLSession.shared;
        guard let url = URL(string: urlString) else {
            return ;
        }
        var request = URLRequest(url: url);
        request.httpMethod = "POST";
        var data : Data?
        do {
            data = try JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
        } catch {
            fatalError();
        }
        guard data != nil else {
            return ;
        }
        request.httpBody = data!;
        let dataTask = session.dataTask(with: request) { (dataer, response, error) in
            
            guard let result = dataer else {
                return ;
            }
            guard let str = String.init(data: result, encoding: String.Encoding.utf8) else {
                return ;
            }
            print(str);
        }
        dataTask.resume();
        
        
    }
    
    
}
