//
//  PhotoFooter.swift
//  LittlePink
//
//  Created by 瑞文 on 2023/2/24.
//

import UIKit

class PhotoFooter: UICollectionReusableView {
    @IBOutlet weak var addPhotoBtn: UIButton!
    
  
    override func awakeFromNib() {
        super.awakeFromNib()
        addPhotoBtn.layer.borderWidth = 1
        addPhotoBtn.layer.borderColor = UIColor.quaternaryLabel.cgColor
        
    }
       
    
}
