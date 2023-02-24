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
        
        // MARK: 设置上方的bar,按钮,条的UI
        
        //1.整体bar--在sb上设
        
        //2.selectedBar--按钮下方的条
        settings.style.selectedBarBackgroundColor = UIColor(named: "main")!
        settings.style.selectedBarHeight = 3
        
        //3.buttonBarItem--文本或图片的按钮
        settings.style.buttonBarItemBackgroundColor = .clear
        settings.style.buttonBarItemTitleColor = .label
        settings.style.buttonBarItemFont = .systemFont(ofSize: 16)
        
        
        
        
        super.viewDidLoad()
        
        containerView.bounces = false
        changeCurrentIndexProgressive = { (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }

            oldCell?.label.textColor = .secondaryLabel
            newCell?.label.textColor = .label
        }

    }
    
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let followVC = storyboard!.instantiateViewController(identifier: KFllowVCID)
        let nearByVC = storyboard!.instantiateViewController(identifier: KNearByVCID)
        let discoveryVC = storyboard!.instantiateViewController(identifier: KDiscoveryVCID)
        
        return [discoveryVC, followVC, nearByVC]
    }


}

