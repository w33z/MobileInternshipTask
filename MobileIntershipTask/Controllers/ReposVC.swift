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
        
        DataService.instance.fetchRepositories(user: user) { (repos) in
            guard let rep = repos else { print("None repos"); return }
            self.repos = rep

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

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
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "reuse")
        let repo = repos[indexPath.row]
        
        cell.textLabel?.text = repo.name
        cell.detailTextLabel?.text = repo.owner?.login

        return cell
    }

}
