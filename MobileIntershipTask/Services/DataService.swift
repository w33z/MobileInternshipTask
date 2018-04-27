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
        
        let urlString = githubURL + username.lowercased()
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, responce, error) in

                if error != nil {
                    debugPrint(error!.localizedDescription)
                    completion(nil)
                } else {
                    guard let data = data else { return }
                    
                    do {
                        let jsonDecoder = JSONDecoder()
                        let user = try jsonDecoder.decode(User.self, from: data)

                        guard let _ = user.login else { completion(nil); return }

                        completion(user)
                    } catch {
                        debugPrint(error)
                    }
                }
            }.resume()
        }
    }
}
