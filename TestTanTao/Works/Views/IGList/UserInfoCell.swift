//
//  UserInfoCell.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/20.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit
import IGListKit


// MARK: cell视图

class UserInfoCell: UICollectionViewCell {

    @IBOutlet var headImv: UIImageView!
    @IBOutlet var titleLab: UILabel!
    public var onClickArrow: ((UserInfoCell) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.headImv.layer.cornerRadius = 12;
    }

    @IBAction private func onClickArrow(_ sender: UIButton) {
        onClickArrow?(self);
    }
    
}

extension UserInfoCell : ListBindable {
    func bindViewModel(_ viewModel: Any) {
        guard let viewModel = viewModel as? UserInfoCellModel else {
            return ;
        }
        self.headImv.backgroundColor = UIColor.orange;
        self.titleLab.text = viewModel.username;
    }
}



// MARK: Cell模型区域

class UserInfoCellModel {
    var avatar : URL?
    var username : String = ""
    init(avatar:URL?,username:String) {
        self.avatar = avatar;
        self.username = username;
    }
    
}

extension UserInfoCellModel: ListDiffable {
    func diffIdentifier() -> NSObjectProtocol {
        return self.username as NSObjectProtocol
    }
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object {
            return true;
        }
        guard let obj = object as? UserInfoCellModel else { return false }
        return self.username == obj.username
    }
}

