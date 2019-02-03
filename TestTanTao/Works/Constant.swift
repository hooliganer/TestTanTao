//
//  Constant.swift
//  TestTanTao
//
//  Created by tantao on 29/01/2019.
//  Copyright © 2019 tantao. All rights reserved.
//

import Foundation

let APPBundleID = Bundle.main.bundleIdentifier;

let MainScreenWidth = UIScreen.main.bounds.size.width;
let MainScreenHeight = UIScreen.main.bounds.size.height;
let MainScreenCenter = CGPoint(x: MainScreenWidth/2.0, y: MainScreenHeight/2.0);

// 状态栏高度
let StatusHeight = UIApplication.shared.statusBarFrame.size.height
// 导航栏高度
let NavigationHeight = StatusHeight + 44
// 底部tab高度
let TabHeight = StatusHeight > 20 ? 83 : 49


// 颜色 RGBA
func RGBA(_ r:Double, _ g:Double, _ b:Double, _ a:Double) -> UIColor {
    return UIColor(red: CGFloat(r/255.0), green: CGFloat(g/255.0), blue: CGFloat(b/255.0), alpha: CGFloat(a))
}
// 颜色 RGB
func RGB(_ r:Double, _ g:Double, _ b:Double) -> UIColor {
    return RGBA(r, g, b, 1)
}


/// 十六进制颜色
///
/// - Parameters:
///   - hexString: 十六进制字符串
///   - alpha: 透明度
/// - Returns: 颜色color
func HEXColor(hexString:String,alpha:CGFloat) -> UIColor {
    
    //处理数值
    var cString = hexString.uppercased().trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    let length = (cString as NSString).length
    //错误处理
    if (length < 6 || length > 7 || (!cString.hasPrefix("#") && length == 7)){
        //返回whiteColor
        return UIColor.white;
    }
    if cString.hasPrefix("#"){
        cString = (cString as NSString).substring(from: 1)
    }
    //字符chuan截取
    var range = NSRange()
    range.location = 0
    range.length = 2
    
    let rString = (cString as NSString).substring(with: range)
    
    range.location = 2
    let gString = (cString as NSString).substring(with: range)
    
    range.location = 4
    let bString = (cString as NSString).substring(with: range)
    
    //存储转换后的数值
    var r:UInt32 = 0,g:UInt32 = 0,b:UInt32 = 0
    //进行转换
    Scanner(string: rString).scanHexInt32(&r)
    Scanner(string: gString).scanHexInt32(&g)
    Scanner(string: bString).scanHexInt32(&b)
    //根据颜色值创建UIColor
    return UIColor(red: CGFloat(r)/255.0, green: CGFloat(r)/255.0, blue: CGFloat(r)/255.0, alpha: alpha)
}
