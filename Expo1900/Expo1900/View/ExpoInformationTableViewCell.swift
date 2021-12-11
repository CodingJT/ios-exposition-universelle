//
//  ExpoInformationTableViewCell.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import UIKit

class ExpoInformationTableViewCell: UITableViewCell {
    static var identifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet private weak var titleLabel: UILabel! {
        didSet {
            titleLabel.numberOfLines = 0
            titleLabel.baselineAdjustment = .alignCenters
            titleLabel.lineBreakMode = .byWordWrapping
        }
    }
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var visitorsCountLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    
    var title: String? {
        didSet {
            guard let titleText = title, titleText.isEmpty == false else { return }
            titleLabel.text = titleText
        }
    }
    var posterImage: UIImage? {
        didSet {
            posterImageView.image = posterImage
        }
    }
    var visitorsCount: Int? {
        didSet {
            guard let visitorsCount = visitorsCount else { return }
            var visitorsCountText: String = String(visitorsCount)
            
            let visitorFormatter = NumberFormatter()
            visitorFormatter.numberStyle = .decimal
            if let formattedVisitorsCount = visitorFormatter.string(from: NSNumber(integerLiteral: visitorsCount)) {
                visitorsCountText = formattedVisitorsCount
            }
            visitorsCountLabel.text = "방문객 : \(visitorsCountText)명"
        }
    }
    var location: String? {
        didSet {
            let locationText = location ?? "미상"
            locationLabel.text = "개최지 : \(locationText)"
        }
    }
    var duration: String? {
        didSet {
            let durationText = duration ?? "미상"
            durationLabel.text = "개최지 : \(durationText)"
        }
    }
}
