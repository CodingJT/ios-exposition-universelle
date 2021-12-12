//
//  ExhibitionItemDetailViewController.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import UIKit

class ExhibitionItemDetailViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var exhibitionItem: ExhibitionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

extension ExhibitionItemDetailViewController {
    func setupTableView() {
        tableView.separatorStyle = .none
    }
}
