//
//  ExpoInformation.swift
//  Expo1900
//
//  Created by 김진태 on 2021/12/12.
//

import Foundation

struct ExpoInformation: Decodable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
}
