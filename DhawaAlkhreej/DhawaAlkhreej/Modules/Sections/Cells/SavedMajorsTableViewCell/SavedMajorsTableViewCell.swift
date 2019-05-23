//
//  SavedMajorsTableViewCell.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 23/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class SavedMajorsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bottomLine: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        titleLabel.font = Identity.font(.custom(weight: .bold, size: 25))
        bottomLine.backgroundColor = Identity.color(.brownBackground).withAlphaComponent(0.3)
    }
}
