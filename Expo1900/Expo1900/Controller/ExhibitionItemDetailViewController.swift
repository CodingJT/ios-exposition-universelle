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
        setupNavigationTitle()
        setupTableView()
    }
}

extension ExhibitionItemDetailViewController {
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
    }
    
    func setupNavigationTitle() {
        navigationItem.title = exhibitionItem?.name
    }
}

extension ExhibitionItemDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let exhibitionItem = exhibitionItem else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            let cellIdentifier = CenterImageTableViewCell.identifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CenterImageTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.centerImageView.image = UIImage(named: exhibitionItem.imageName)
            return cell
        case 1:
            let cellIdentifier = DescriptionTableViewCell.identifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? DescriptionTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            cell.descriptionLabel.text = exhibitionItem.description
            return cell
        default:
            return UITableViewCell()
        }
    }
}
