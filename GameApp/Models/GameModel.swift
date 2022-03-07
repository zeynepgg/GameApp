//
//  GameModel.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 6.03.2022.
//

import Foundation

struct GameModel: Decodable {
    var results: [Game]?
}

struct Game: Decodable {
    var id: Int?
    var slug: String?
    var name: String?
    var background_image: String?
    var rating: Double?
    var released: String?
}
