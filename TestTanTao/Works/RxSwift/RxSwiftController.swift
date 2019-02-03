//
//  RxSwiftController.swift
//  TestTanTao
//
//  Created by tantao on 29/01/2019.
//  Copyright © 2019 tantao. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

fileprivate let minimalUsernameLength = 5
fileprivate let minimalPasswordLength = 5

class RxSwiftController: UIViewController {

    @IBOutlet var okBtn: UIButton!
    @IBOutlet var passwordValidOutlet: UILabel!
    @IBOutlet var passwordOutlet: UITextField!
    @IBOutlet var usernameValidOutlet: UILabel!
    @IBOutlet var usernameOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }



}
