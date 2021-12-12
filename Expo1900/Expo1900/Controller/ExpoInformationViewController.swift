//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpoInformationViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var expoInformation: ExpoInformation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadExpoInformationData()
        setupTableView()
    }
    
    func loadExpoInformationData() {
        let decoder = JSONDecoder()
        guard let expoInformationData = NSDataAsset(name: "exposition_universelle_1900") else {
            return
        }
        
        do {
            let decodedExpoInformation = try decoder.decode(ExpoInformation.self, from: expoInformationData.data)
            self.expoInformation = decodedExpoInformation
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func setupTableView() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
    }
}

extension ExpoInformationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let identifier = tableViewCellIdentifier(forRowAt: indexPath) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.selectionStyle = .none
        
        guard let expoInformation = self.expoInformation else { return cell }
        
        if indexPath.row == 0, let cell = cell as? ExpoInformationTableViewCell {
            let posterImageName = "poster"
            
            cell.duration = expoInformation.duration
            cell.title = expoInformation.title
            cell.visitorsCount = expoInformation.visitors
            cell.location = expoInformation.location
            cell.duration = expoInformation.duration
            cell.posterImage = UIImage(named: posterImageName)
        } else if indexPath.row == 1, let cell = cell as? DescriptionTableViewCell {
            cell.descriptionLabel.text = expoInformation.description
        }
        return cell
    }
    
    func tableViewCellIdentifier(forRowAt indexPath: IndexPath) -> String? {
        guard indexPath.section == 0 else { return nil }
        switch indexPath.row {
        case 0: return ExpoInformationTableViewCell.identifier
        case 1: return DescriptionTableViewCell.identifier
        default: return nil
        }
    }
}
