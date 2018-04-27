//
//  RepoDetailVC.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 27/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import UIKit

class RepoDetailVC: UIViewController {
    
    var repo: Repo! {
        didSet {
            title = repo.name
        }
    }
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        
        if let description = repo.description {
            label.text = description
        }

        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ownerLabel: UILabel = {
        let label = UILabel()
        
        if let owner_login = repo.owner?.login {
            label.attributedText = NSAttributedString(string: "Owner: \(owner_login)", attributes: [
                NSAttributedStringKey.font : UIFont(name: "Avenir-medium", size: 22)!
                ])
        }
        label.font.withSize(16)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ownerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.makeRounded(15)
        imageView.backgroundColor = UIColor.red
        return imageView
    }()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        addSubviews()
        addConstraints()
    }
    
    fileprivate func addSubviews() {
        view.addSubview(ownerLabel)
        view.addSubview(ownerImage)
        view.addSubview(descriptionLabel)
    }
    
    fileprivate func addConstraints() {
        ownerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        ownerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        ownerLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
        ownerImage.centerYAnchor.constraint(equalTo: ownerLabel.centerYAnchor).isActive = true
        ownerImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        ownerImage.heightAnchor.constraint(equalToConstant: 75).isActive = true
        ownerImage.widthAnchor.constraint(equalToConstant: 75).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: ownerImage.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35).isActive = true
        descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
    }
}
