//
//  Repo.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 27/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import Foundation

struct Repo: Codable {
    var id: Int?
    var name: String?
    var owner: User?
    var description: String?
    var language: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case owner
        case description
        case language
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        owner = try values.decodeIfPresent(User.self, forKey: .owner)
        description = try values.decodeIfPresent(String.self, forKey: .description)
        language = try values.decodeIfPresent(String.self, forKey: .language)
    }
}
