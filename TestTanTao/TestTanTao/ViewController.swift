//
//  ViewController.swift
//  TestTanTao
//
//  Created by tantao on 2018/11/20.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit
import Alamofire
import Firebase

class ViewController: UIViewController,UIPickerViewDelegate {
    
    @IBOutlet var aBtn: UIButton!
    @IBOutlet var bBtn: UIButton!
    @IBOutlet var slider: UISlider!
    @IBOutlet var picker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "主界面"
        self.picker.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        
    }
    
    @IBAction func clickUp(_ sender: UIButton) {
        
    }
    
    @IBAction func clickDown(_ sender: UIButton) {
        
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        print("\n \(sender) \n")
    }
    
    
    /// 添加创建并添加本地通知
    func addANotification() {
        
        // 初始化一个通知
        let localNoti = UILocalNotification()
        
        // 通知的触发时间，例如即刻起15分钟后
        let fireDate = Date().addingTimeInterval(5)
        localNoti.fireDate = fireDate
        // 设置时区
        localNoti.timeZone = NSTimeZone.default
        // 通知上显示的主题内容
        localNoti.alertBody = "通知上显示的提示内容"
        // 收到通知时播放的声音，默认消息声音
        localNoti.soundName = UILocalNotificationDefaultSoundName
        //待机界面的滑动动作提示
        localNoti.alertAction = "打开应用"
        // 应用程序图标右上角显示的消息数
        localNoti.applicationIconBadgeNumber = 0
        // 通知上绑定的其他信息，为键值对
        localNoti.userInfo = ["id": "1",  "name": "xxxx"]
        
        // 添加通知到系统队列中，系统会在指定的时间触发
        UIApplication.shared.scheduleLocalNotification(localNoti)
        
    }
}

