//
//  DescriptionTableViewCell.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import UIKit

class DescriptionTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var descriptionLabel: UILabel!
}
