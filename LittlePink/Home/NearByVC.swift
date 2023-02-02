//
//  NearByVC.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/2.
//

import UIKit
import XLPagerTabStrip

class NearByVC: UIViewController ,IndicatorInfoProvider{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        
        return IndicatorInfo(title: "附近")
    }
    
    
}
