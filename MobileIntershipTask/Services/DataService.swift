//
//  DataService.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 26/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import Foundation

class DataService {
    static var instance = DataService()
        
    func fetchUser(username: String, _ completion: @escaping (_ user: User?) ->()) {
        
        let urlString = GITHUB_URL + username.lowercased()
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, responce, error) in

                if error == nil {
                    guard let data = data else { return }
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let user = try jsonDecoder.decode(User.self, from: data)
                        
                        guard let _ = user.login else { completion(nil); return }
                        
                        completion(user)
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                } else {
                    debugPrint(error!.localizedDescription)
                    completion(nil)
                }
            }.resume()
        }
    }
    
    func fetchRepositories(user: User?, _ completion: @escaping (_ repos: [Repo]?) -> ()){
        
        guard let user_repostURL = user?.repos_url else { return }
        
        if let url = URL(string: user_repostURL) {
            URLSession.shared.dataTask(with: url) { (data, responce, error) in

                if error == nil {
                    guard let data = data else { return }
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let repos = try jsonDecoder.decode([Repo].self, from: data)
                        
                        if repos.count == 0 {
                            completion(nil)
                            return
                        }
                        
                        completion(repos)
                    } catch {
                        debugPrint(error.localizedDescription)
                    }
                } else {
                    debugPrint(error!.localizedDescription)
                    completion(nil)
                }
            }.resume()
        }
    }
}
