//
//  HomeVC.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/2.
//

import UIKit
import XLPagerTabStrip

class HomeVC: ButtonBarPagerTabStripViewController {
    
    override func viewDidLoad() {
        //MARK: 设置上方title
        //selectedBar--按钮下方条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        //按钮背景以及字体样式
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        //按钮间距
        settings.style.buttonBarItemLeftRightMargin  = 0
        
        
        super.viewDidLoad()
        //防止主页面左右滑动
        containerView.bounces = false;
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            
            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
            
        }
        
        //调整韩式页面
        DispatchQueue.main.async {
            self.moveToViewController(at: 1, animated: false)
        }
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //获取三个页面
    override func viewControllers (for pagerTabStripViewController:PagerTabStripViewController)->
    [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: KFllowVCID)
        let nearByVC = storyboard!.instantiateViewController(identifier: KNearByVCID)
        let discoverVC = storyboard!.instantiateViewController(identifier: KDiscoveryVCID)
        
        return [followVC,discoverVC,nearByVC]
    }
    
    
    
}
