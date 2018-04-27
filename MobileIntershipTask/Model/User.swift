//
//  User.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 26/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import Foundation

struct User: Codable {
    var login: String?
    var id: Int?
    var avatar_url: String?
    var repos_url: String?
    
    enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatar_url
        case repos_url
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        login = try values.decodeIfPresent(String.self, forKey: .login)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        avatar_url = try values.decodeIfPresent(String.self, forKey: .avatar_url)
        repos_url = try values.decodeIfPresent(String.self, forKey: .repos_url)
    }
}
