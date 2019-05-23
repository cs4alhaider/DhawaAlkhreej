//
//  MajorDetailsTableViewCell.swift
//  DhawaAlkhreej
//
//  Created by Abdullah Alhaider on 23/05/2019.
//  Copyright © 2019 DhawaAlkhreej. All rights reserved.
//

import UIKit

class MajorDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }

    private func setup() {
        titleLabel.font = Identity.font(.h4)
    }
}
