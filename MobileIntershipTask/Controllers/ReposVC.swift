//
//  ReposVC.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 27/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import UIKit

class ReposVC: UITableViewController {
    
    var user: User! {
        didSet {
            title = user.login
        }
    }
    
    var repos = [Repo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ReposTableViewCell.self, forCellReuseIdentifier: REPOS_CELL)
        
        DataService.instance.fetchRepositories(user: user) { (repos) in
            guard let rep = repos else { print("None repos"); return }
            self.repos = rep

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ReposVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if repos.count > 0 {
            tableView.separatorStyle = .singleLine
            return 1
        } else {
            TableViewHelper.EmptyMessage(message: "User don't have any repositories!", viewController: self)
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: REPOS_CELL, for: indexPath) as? ReposTableViewCell else { return UITableViewCell() }
        
        let repo = repos[indexPath.row]
        cell.configureCell(repo: repo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let repo = repos[indexPath.row]
        let detailVC = RepoDetailVC()
        detailVC.repo = repo
        navigationController?.pushViewController(detailVC, animated: true)
    }
}
