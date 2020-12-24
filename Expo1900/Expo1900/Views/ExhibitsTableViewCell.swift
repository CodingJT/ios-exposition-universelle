//
//  ExhibitsTableViewCell.swift
//  Expo1900
//
//  Created by 김호준 on 2020/12/22.
//

import UIKit

class ExhibitsTableViewCell: UITableViewCell {
    static let reuseIdentifier = "ExhibitsTableViewCell"
    
    //MARK: - Views
    private let exhibitStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.spacing = 8
        return stackView
    }()
    
    private let exhibitImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        return imageView
    }()
    
    private let nameShortDescriptionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        stackView.distribution = .fill
        stackView.alignment = .leading
        return stackView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    private let shortDescriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .label
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    //MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureStackView()
        contentView.addSubview(exhibitStackView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - public
    public func configureCell(with exhibit: Exhibit?) {
        guard let exhibit = exhibit else {
            return
        }
        nameLabel.text = exhibit.name
        shortDescriptionLabel.text = exhibit.shortDescription
        exhibitImageView.image = exhibit.exhibitImage
    }
    
    //MARK: - private
    private func setupConstraints() {
        var constraints = [NSLayoutConstraint]()
        constraints.append(exhibitStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor))
        constraints.append(exhibitStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor))
        constraints.append(exhibitStackView.topAnchor.constraint(equalTo: contentView.topAnchor))
        constraints.append(exhibitStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    private func configureStackView() {
        nameShortDescriptionStackView.addArrangedSubview(nameLabel)
        nameShortDescriptionStackView.addArrangedSubview(shortDescriptionLabel)
        exhibitStackView.addArrangedSubview(exhibitImageView)
        exhibitStackView.addArrangedSubview(nameShortDescriptionStackView)
    }
}
