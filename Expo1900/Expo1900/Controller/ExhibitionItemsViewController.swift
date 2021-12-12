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
        tableView.separatorStyle = .none
    }
}
