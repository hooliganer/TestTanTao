//
//  BaseListViewController.swift
//  TestTanTao
//
//  Created by tantao on 2018/12/20.
//  Copyright © 2018 tantao. All rights reserved.
//

import UIKit
import IGListKit

class BaseListViewController: UIViewController,ListAdapterDataSource {
    
    let collectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: flow);
        return collection;
    }()
    
    //存放数据的数组，数据模型需要实现ListDiffable协议，主要实现判等
    var objects = [ListDiffable]();
    lazy var adapter : ListAdapter = {
        let adp = ListAdapter(updater: ListAdapterUpdater(), viewController: self);
        return adp;
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.collectionView);
        self.adapter.collectionView = self.collectionView;
        adapter.dataSource = self;
    }


    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
        self.collectionView.frame = self.view.bounds;
    }
    
    
    
    // MARK: ListAdapterDataSource协议
    
    //返回要在collectionView中显示的所有数据
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        return self.objects;
    }
    
    //返回每个数据对应的sectionController
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        //ListSectionController是抽象基类，不能直接使用，必须子类化，这里这么写是因为是在基类BaseListViewController里
        return ListSectionController();
    }
    
    //数据为空时显示的占位视图
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil;
    }
    

}
