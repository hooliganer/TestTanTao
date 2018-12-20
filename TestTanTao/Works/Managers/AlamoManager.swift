//
//  AlamoManager.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/17.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit
import Alamofire

typealias Block = ((Int) -> Void)

class AlamoManager: NSObject {
    
    lazy var sessionManager : Alamofire.SessionManager = {
        let configure = URLSessionConfiguration.default;
        configure.timeoutIntervalForRequest = 30;
        let mng = Alamofire.SessionManager.init(configuration: configure);
        return mng;
    }();
    
    func loadHtml(url:String) {
        
        self.sessionManager.request(url).responseJSON { (res) in
            print("\n \(res) \n")
        }
        
//        Alamofire.request(url, method: HTTPMethod.post, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (result) in
//            print("\n \(result) \n")
//        }
    }
    
    func load100() {
        
        for i in 0..<1000 {
            Alamofire.request("https://suggest.taobao.com/sug?", method: HTTPMethod.post, parameters: ["code":"utf-8","q":"卫衣","callback":"cb"], encoding: JSONEncoding.default, headers: nil).responseJSON { response in
                
                //            print("Request: \(String(describing: response.request))")   // original url request
                //            print("Response: \(String(describing: response.response))") // http url response
                //            print("Result: \(response.result)")                         // response serialization result
                //
                //            if let json = response.result.value {
                //                print("JSON: \(json)") // serialized json response
                //            }
                //
                //            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
                //                print("Data: \(utf8Text)") // original server data as UTF8 string
                //            }
                print("\n \(i) \n")
            }
        }
    }
    
    func adfasdaf(_ a:Int? = 0,dd b:Int? = 3) {
        
    }
    
    func sum(a:Int,b:Int,block:Block ) -> Void{
        
    }
    
    func sum1(a:Int,b:Int,block:@escaping(Block)) -> Void {
        DispatchQueue.global().async {
            sleep(3)
            DispatchQueue.main.async {
                block(a+b)
                print("a+b 1")
            }
        }
        print("1111")
    }
    
    func loadHttp(result:@escaping (String) -> Void) {
        print("load start")
        DispatchQueue.global().async {
            sleep(3)
            result("load finish")
        }
        print("waiting...")
    }
    
    func loadddd(a:Int,block:(Int) -> Void,c:String)  {
        
    }
    
    func testGet() {
        
////        let parameters: Parameters = ["foo": "bar"];
//////        Alamofire.request("https://httpbin.org/get",method:.get, parameters: parameters)
////        request("",  parameters: nil)
////        adfasdaf( dd: 3)
//
////        sum(a: 2, b: 2) { (v) in
////            print("0-\(v)")
////        }
//        let str = "tom";
//
//        DispatchQueue.global().async {
//            DispatchQueue.main.async {
//
//            }
//        }
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.init(uptimeNanoseconds: 2)) {
//
//        }
//
//        let group = DispatchGroup();
//        let work1 = DispatchWorkItem.init {
//
//        }
//
//        DispatchQueue.global().async(group: group, execute: work1);
//
//        //https://suggest.taobao.com/sug?code=utf-8&q=%E5%8D%AB%E8%A1%A3&callback=cb
////        Alamofire.request("https://suggest.taobao.com/sug?").responseData { (dataResponse) in
////            print(dataResponse.data);
////        }
//
////        Alamofire.request("https://suggest.taobao.com/sug?", method: HTTPMethod.post, parameters: ["code":"utf-8","q":"卫衣","callback":"cb"], encoding: JSONEncoding.default, headers: nil).responseJSON { response in
////
////            print("Request: \(String(describing: response.request))")   // original url request
////            print("Response: \(String(describing: response.response))") // http url response
////            print("Result: \(response.result)")                         // response serialization result
////
////            if let json = response.result.value {
////                print("JSON: \(json)") // serialized json response
////            }
////
////            if let data = response.data, let utf8Text = String(data: data, encoding: .utf8) {
////                print("Data: \(utf8Text)") // original server data as UTF8 string
////            }
////        }
////        let headers = ["apikey":"a566eb03378211f7dc9ff15ca78c2d93"];
////        Alamofire.request(.GET, "http://apis.baidu.com/heweather/pro/weather?city=beijing", headers: headers)
////            .responseJSON { response in
////                print("result==\(response.result)")
////                if let jsonValue = response.result.value {
////
////                    print("weNeedReuslt ==  \(jsonValue)")
////                }
////
////        }
        
    }
}
