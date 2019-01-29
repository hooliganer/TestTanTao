//
//  UIButtonExtension.swift
//  TestTanTao
//
//  Created by tantao on 17/01/2019.
//  Copyright © 2019 tantao. All rights reserved.
//

import Foundation
import FirebaseAnalytics

extension UIButton {
    open override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
        super.sendAction(action, to: target, for: event)
        
        if event?.allTouches?.first?.phase == UITouch.Phase.began {

            let param = [
                "button_action_name":action.description,
                "button_target":String(describing: target ?? "nil target")
            ]
            Analytics.logEvent("button_touch_down", parameters: param)
        } else if event?.allTouches?.first?.phase == UITouch.Phase.ended {
            let param = [
                "button_action_name":action.description,
                "button_target":String(describing: target ?? "nil target")
            ]
            Analytics.logEvent("button_touch_upinside", parameters: param)
        }
    }

}
