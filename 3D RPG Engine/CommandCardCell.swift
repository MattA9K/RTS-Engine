//
//  CommandCardCell.swift
//  3D RPG Engine
//
//  Created by Mateusz Andrzejczuk on 12/18/16.
//  Copyright © 2016 Core Prime Inc. All rights reserved.
//

import UIKit


class CommandCardCell : UICollectionViewCell {
    
    var coreTitleLabel : UILabel!
    var coreImageView : UIImageView!
    
    override init(frame: CGRect) {
        let titleLabelFrame : CGRect = CGRect(x:0,y:0,width:100,height:25)
        coreTitleLabel = UILabel(frame: titleLabelFrame)
        coreTitleLabel.textColor = .white
        coreTitleLabel.shadowColor = .black
        coreTitleLabel.text = "\(Int(arc4random_uniform(UInt32(9999))))"
        coreTitleLabel.adjustsFontSizeToFitWidth = true
        
        let imageViewFrame : CGRect = CGRect(x:0,y:0,width:300,height:300)
        coreImageView = UIImageView(frame: imageViewFrame)
        coreImageView.image = UIImage(named: "test_img")
        coreImageView.contentMode = .scaleAspectFit
        coreImageView.clipsToBounds = true
        
        super.init(frame: frame)
        
        contentView.addSubview(coreTitleLabel)
        contentView.addSubview(coreImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
