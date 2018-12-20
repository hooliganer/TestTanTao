//
//  WebTableCell.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/18.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit

class WebTableCell: UITableViewCell {

    @IBOutlet var WebView: UIWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
