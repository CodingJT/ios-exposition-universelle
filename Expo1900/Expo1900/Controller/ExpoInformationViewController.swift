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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = ExpoInformationTableViewCell.identifier
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ExpoInformationTableViewCell else {
            return UITableViewCell()
        }
        
        if let expoInformation = self.expoInformation {
            let posterImageName = "poster"
            
            cell.durationLabel.text = expoInformation.duration
            cell.titleLabel.text = expoInformation.title
            cell.visitorsCountLabel.text = "\(expoInformation.visitors)명"
            cell.locationLabel.text = expoInformation.location
            cell.durationLabel.text = expoInformation.duration
            cell.posterImageView.image = UIImage(named: posterImageName)
        }
        
        return cell
    }
}
