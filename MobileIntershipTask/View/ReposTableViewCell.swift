//
//  ReposTableViewCell.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 27/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let languageLabel: UILabel = {
        let label = UILabel()
        label.text = "Language"
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
 
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubviews()
        addConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func addSubviews() {
        addSubview(nameLabel)
        addSubview(languageLabel)
    }
    
    fileprivate func addConstraints() {
        nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        languageLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10).isActive = true
        languageLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        languageLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        languageLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
    }
    
    func configureCell(repo: Repo){
        guard let name = repo.name, let language = repo.language else { return }
        
        nameLabel.text = name
        languageLabel.text = language
    }
}
