//
//  TabBarC.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/6.
//

import UIKit
import YPImagePicker
class TabBarC: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        
        if let vc = viewController as? PostVC {
            
            //TODO（判断是否登陆）
            var config = YPImagePickerConfiguration()
            
            config.isScrollToChangeModesEnabled = false//是否允许左滑右滑
            config.onlySquareImagesFromCamera = false// 是否只允许正方形照片
            config.usesFrontCamera = false// 默认打开前置摄像头
            config.albumName = "测试相册"    // 保存到相册 的相册名
            config.startOnScreen = YPPickerScreen.library   // 默认打开设置
            config.screens = [.library, .video,.photo]//画布顺序
            config.showsCrop = .none// 裁剪功能
            
            //MARK: 变焦
            config.maxCameraZoomFactor = 5.0
//            config.fonts..
            
            //MARK: 相册配置
            config.library.mediaType = YPlibraryMediaType.photo
            config.library.defaultMultipleSelection = false
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.minNumberOfItems = 1 //每行现实图片数量
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 1.0 // 图片间隙
            config.library.skipSelectionsGallery = false //跳过编辑页面
            config.library.preselectedItems = nil
            config.library.preSelectItemOnMultipleSelection = true
            
            //MARK: 多选完后展示和编辑页面 删除按钮
            config.gallery.hidesRemoveButton = false
            
            //MARK: 视频配置
            config.video.fileType = .mov //视频后缀
            config.video.recordingTimeLimit = 60.0 //视频最大时长
            config.video.libraryTimeLimit = 60.0 //用户相册选取最大时长
            config.video.minimumTimeLimit = 3.0 //最短时长
            config.video.trimmerMaxDuration = 60.0 //允许剪辑最大时长
            config.video.trimmerMinDuration = 3.0 //允许剪辑最小时长
            
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, _ in
                
                
                if let photo = items.singlePhoto {
//                    print(photo.fromCamera) // Image source (camera or library)
//                    print(photo.image) // Final image selected by the user
//                    print(photo.originalImage) // original image selected by the user, unfiltered
                }
                picker.dismiss(animated: true, completion: nil)
            }//闭包处理，先present 再运行中间闭包
            
            present(picker, animated: true, completion: nil)
            
        
            return false
        }
        return true
        
    }
    
    
    
}
