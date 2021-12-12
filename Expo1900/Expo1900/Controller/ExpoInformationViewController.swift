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
        if indexPath.row == 0 {
            let identifier = ExpoInformationTableViewCell.identifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ExpoInformationTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            if let expoInformation = self.expoInformation {
                let posterImageName = "poster"
                
                cell.duration = expoInformation.duration
                cell.title = expoInformation.title
                cell.visitorsCount = expoInformation.visitors
                cell.location = expoInformation.location
                cell.duration = expoInformation.duration
                cell.posterImage = UIImage(named: posterImageName)
            }
            return cell
        } else {
            let identifier = DescriptionTableViewCell.identifier
            guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? DescriptionTableViewCell else {
                return UITableViewCell()
            }
            cell.selectionStyle = .none
            
            if let expoInformation = self.expoInformation {
                cell.descriptionLabel.text = expoInformation.description
            }
            return cell
        }
    }
}
