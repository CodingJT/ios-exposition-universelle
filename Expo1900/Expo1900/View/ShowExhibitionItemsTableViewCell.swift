//
//  ShowExhibitionItemsTableViewCell.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import UIKit

protocol ShowExhibitionItemsTableViewCellDelegate {
    func showExhibitionItemsButtonTapped(_ sender: UIButton)
}

class ShowExhibitionItemsTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    var delegate: ShowExhibitionItemsTableViewCellDelegate?
    
    @IBAction private func showExhibitionItemsButtonTapped(_ sender: UIButton) {
        delegate?.showExhibitionItemsButtonTapped(sender)
    }
}
