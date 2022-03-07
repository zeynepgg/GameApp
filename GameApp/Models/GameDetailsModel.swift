//
//  GameDetailsModel.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 7.03.2022.
//

import Foundation

struct GameDetailsModel: Decodable {
    var id: Int?
    var slug: String?
    var name: String?
    var description_raw: String?
    var metacritic: Int?
}
