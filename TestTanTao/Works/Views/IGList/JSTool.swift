//
//  JSTool.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/20.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class JSTool {
    
    /// 解码
    ///
    /// - Parameters:
    ///   - _: 类型
    ///   - json: json文件名
    ///   - bundle: 路径
    /// - Returns: 返回类型
    /// - Throws: 符合Decodable的类型才能使用
    open class func decode<T>(_ :T.Type,jsonFileName json: String,from bundle:Bundle! = Bundle.main) throws -> T where T: Decodable {
        let url = bundle.url(forResource: json, withExtension: "json")
        var data = Data()
        if let gUrl = url {
            data = try Data(contentsOf: gUrl)
        }
        let decode = JSONDecoder()
        let items = try decode.decode(T.self, from: data)
        return items
    }
    
    
    
}


