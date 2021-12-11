//
//  ExhibitionItem.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import Foundation

struct ExhibitionItem: Codable {
    var name: String
    var imageName: String
    var shortDescription: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
}
