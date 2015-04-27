//
//  CollectionController.swift
//  ReneArgento
//
//  Created by Rene Argento on 4/23/15.
//  Copyright (c) 2015 wwdc. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var textLabel: UILabel?
    var imageView: UIImageView?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.imageView = UIImageView(frame: CGRect(x: 0, y: 16, width: frame.size.width, height: frame.size.height*2/3))
        imageView!.contentMode = UIViewContentMode.ScaleAspectFit
        
        let textFrame = CGRect(x: 0, y: 60, width: frame.size.width + 2, height: frame.size.height/3)
        textLabel = UILabel(frame: textFrame)
        textLabel!.font = UIFont.systemFontOfSize(UIFont.smallSystemFontSize())
        textLabel!.textAlignment = .Center
        
        contentView.addSubview(imageView!)
        contentView.addSubview(textLabel!)
    }
    
}