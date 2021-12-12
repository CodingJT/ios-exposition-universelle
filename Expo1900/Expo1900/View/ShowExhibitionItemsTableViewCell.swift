//
//  ShowExhibitionItemsTableViewCell.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import UIKit

class ShowExhibitionItemsTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    @IBAction func showExhibitionItemsButtonTapped(_ sender: UIButton) {
        print("\(#function) Executed")
    }
}
