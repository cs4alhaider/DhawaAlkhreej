//
//  SectionsCollectionViewCell.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 21/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class SectionsCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var sectionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    private func setupUI() {
        backView.applyShadowWithRoundCorners(shadowColor: .black,
                                             cornerRadius: 12,
                                             shadowOpacity: 0.3,
                                             shadowRadius: 4)
    }

}
