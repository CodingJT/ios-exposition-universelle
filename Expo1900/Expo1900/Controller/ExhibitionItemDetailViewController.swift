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
        guard let cellIdentifier = tableViewCellIdentifier(forRowAt: indexPath) else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        cell.selectionStyle = .none
   
        switch indexPath.row {
        case 0:
            guard let centerImageCell = cell as? CenterImageTableViewCell else {
                return cell
            }
            centerImageCell.centerImageView.image = UIImage(named: exhibitionItem.imageName)
        case 1:
            guard let descriptionCell = cell as? DescriptionTableViewCell else {
                return UITableViewCell()
            }
            descriptionCell.descriptionLabel.text = exhibitionItem.description
        default:
            break
        }
        return cell
    }
    
    func tableViewCellIdentifier(forRowAt indexPath: IndexPath) -> String? {
        guard indexPath.section == 0 else { return nil }
        switch indexPath.row {
        case 0:
            return CenterImageTableViewCell.identifier
        case 1:
            return DescriptionTableViewCell.identifier
        default:
            return nil
        }
    }
}
