//
//  ExhibitionItemsViewController.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import UIKit

class ExhibitionItemsViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var exhibitionItems: [ExhibitionItem]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExhibitionItemsData()
        setupTableView()
    }
}

extension ExhibitionItemsViewController {
    func loadExhibitionItemsData() {
        let jsonDecoder = JSONDecoder()
        guard let exhibitionItemsData = NSDataAsset(name: "items") else { return }
        
        do {
            let decodedExhibitionItems = try jsonDecoder.decode([ExhibitionItem].self, from: exhibitionItemsData.data)
            self.exhibitionItems = decodedExhibitionItems
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? ExhibitionItemDetailViewController else { return }
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else { return }
        let exhibitionItem = exhibitionItems?[selectedIndexPath.row]
        destination.exhibitionItem = exhibitionItem
    }
}

extension ExhibitionItemsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exhibitionItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = ExhibitionItemTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ExhibitionItemTableViewCell else {
            return UITableViewCell()
        }
        guard let exhibitionItem = exhibitionItems?[indexPath.row] else { return cell }
        
        cell.titleLabel.text = exhibitionItem.name
        cell.descriptionLabel.text = exhibitionItem.shortDescription
        cell.itemImageView.image = UIImage(named: exhibitionItem.imageName)
        
        return cell
    }
}

extension ExhibitionItemsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
