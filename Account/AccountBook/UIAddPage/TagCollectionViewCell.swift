//
//  TagCollectionViewCell.swift
//  AccountBook
//
//  Created by FengCL on 2020/12/24.
//  Copyright © 2020 陈华纲. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var tagImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        tagImageView.layer.cornerRadius=90
        tagImageView.layer.masksToBounds=true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder )
    }
    
    
}
