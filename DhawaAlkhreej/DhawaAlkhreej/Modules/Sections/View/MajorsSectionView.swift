//
//  MajorsSectionView.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 23/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import Helper4Swift

class MajorsSectionView: UIView {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomLine: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        addSubviewFromNib()
        titleLabel.font = Identity.font(.custom(weight: .bold, size: 22))
        bottomLine.backgroundColor = Identity.color(.brownBackground).withAlphaComponent(0.3)
    }
}
