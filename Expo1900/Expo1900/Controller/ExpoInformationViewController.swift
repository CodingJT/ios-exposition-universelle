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
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension ExpoInformationViewController {
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
    
    func setupNavigationBar() {
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            navigationController?.navigationBar.standardAppearance = appearance
            navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    }
}

extension ExpoInformationViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let identifier = tableViewCellIdentifier(forRowAt: indexPath) else {
            return UITableViewCell()
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.selectionStyle = .none
        
        guard let expoInformation = self.expoInformation else { return cell }
        
        switch indexPath.row {
        case 0:
            guard let expoInformationCell = cell as? ExpoInformationTableViewCell else { return cell }
            let posterImageName = "poster"
            
            expoInformationCell.duration = expoInformation.duration
            expoInformationCell.title = expoInformation.title
            expoInformationCell.visitorsCount = expoInformation.visitors
            expoInformationCell.location = expoInformation.location
            expoInformationCell.duration = expoInformation.duration
            expoInformationCell.posterImage = UIImage(named: posterImageName)
        case 1:
            guard let descriptionCell = cell as? DescriptionTableViewCell else { return cell }
            descriptionCell.descriptionLabel.text = expoInformation.description
        default:
            break
        }
        return cell
    }
    
    func tableViewCellIdentifier(forRowAt indexPath: IndexPath) -> String? {
        guard indexPath.section == 0 else { return nil }
        switch indexPath.row {
        case 0: return ExpoInformationTableViewCell.identifier
        case 1: return DescriptionTableViewCell.identifier
        case 2: return ShowExhibitionItemsTableViewCell.identifier
        default: return nil
        }
    }
}
