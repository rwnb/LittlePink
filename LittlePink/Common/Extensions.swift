//
//  Extensions.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/22.
//



import UIKit

extension UIView {
    @IBInspectable
    var Radius: CGFloat{
        get{
            return layer.cornerRadius
        }
        set{
            self.layer.cornerRadius = newValue
        }
    }
    
}
extension UIViewController {
    
    //MARK: -展示架在框或提示框
    
    //MARK: 加载框--手动隐藏
    
    //MARK: 提示框--自动隐藏
    func showTextHud(_ tittle: String , _ subTitle: String? = nil){
        //提示弹框
        let hud =  MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .text
        hud.label.text = tittle
        hud.detailsLabel.text = subTitle
        hud.hide(animated: true, afterDelay: 2)
    }
}
