//
//  NoteEditVC.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/22.
//

import UIKit
import YPImagePicker

class NoteEditVC: UIViewController {
    
    var photos = [
        UIImage(named: "1"),
    ]
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    
    var photoCount: Int{ photos.count } //计算属性
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
}

extension NoteEditVC :UICollectionViewDataSource {
    
    //返回数量
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KPhotoCellID, for: indexPath) as! PhotoCell
        
        cell.imageView.image = photos[indexPath.item]
        
        cell.contentView.layer.cornerRadius = 10
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        //      let photoFotter =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KPhotoFooterID, for: indexPath) as! PhotoFooter
        //
        //        return photoFotter
        switch kind {
        case UICollectionView.elementKindSectionFooter :
            let photoFotter =  collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: KPhotoFooterID, for: indexPath) as! PhotoFooter
            
            photoFotter.addPhotoBtn.addTarget(self, action: #selector(addPhoto), for: .touchUpInside)
            
            return photoFotter
            
        default :
            fatalError("collectionView的footer出问题了")
        }
    }
    
}

extension NoteEditVC: UICollectionViewDelegate {
    
}

//MARK:  - 监听
extension NoteEditVC {
    @objc private func addPhoto(){
        if photoCount < kMaxPhotoCount {
            //TODO（判断是否登陆）
            var config = YPImagePickerConfiguration()
            
            //            config.isScrollToChangeModesEnabled = false//是否允许左滑右滑
            config.onlySquareImagesFromCamera = false// 是否只允许正方形照片
            config.usesFrontCamera = false// 默认打开前置摄像头
            //            config.albumName = "测试相册"    // 保存到相册 的相册名
            config.startOnScreen = YPPickerScreen.library   // 默认打开设置
            config.screens = [.library ]//画布顺序 .video,.photo
            config.showsCrop = .none// 裁剪功能
            
            //MARK: 变焦
            config.maxCameraZoomFactor = 5.0
            //            config.fonts..
            
            //MARK: 相册配置
            config.library.mediaType = YPlibraryMediaType.photo
            config.library.defaultMultipleSelection = true //是否可以多选
            config.library.maxNumberOfItems = kMaxPhotoCount - photoCount
            config.library.minNumberOfItems = 1 //每行现实图片数量
            config.library.numberOfItemsInRow = 4
            config.library.spacingBetweenItems = 1.0 // 图片间隙
            config.library.skipSelectionsGallery = false //跳过编辑页面
            config.library.preselectedItems = nil
            config.library.preSelectItemOnMultipleSelection = true
            
            //MARK: 多选完后展示和编辑页面 删除按钮
            config.gallery.hidesRemoveButton = false
            
            
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, _ in
                
                
                for item in items {
                    
                    if case let .photo(photo) = item {
                        self.photos.append(photo.image)
                    }
                }
                
                self.photoCollectionView.reloadData() //视图刷新
                picker.dismiss(animated: true)
            }//闭包处理，先present 再运行中间闭包
            
            present(picker, animated: true, completion: nil)
            
        }else{
            //提示弹框
            showTextHud("最多只能选择\(kMaxPhotoCount)张照片哦")
        }
        
    }
}
