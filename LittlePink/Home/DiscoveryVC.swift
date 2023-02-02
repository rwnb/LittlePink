//
//  DiscoveryVC.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/2.
//

import UIKit

import XLPagerTabStrip

class DiscoveryVC: ButtonBarPagerTabStripViewController ,IndicatorInfoProvider{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "发现")
    }
    //获取三个页面
    override func viewControllers (for pagerTabStripViewController:PagerTabStripViewController)->
    [UIViewController] {
    
         //MARK:  修改
        return  viewControllers;
        
    }
    
    
    
}
