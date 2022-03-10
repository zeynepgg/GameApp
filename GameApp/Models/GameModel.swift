//
//  GameModel.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 6.03.2022.
//

import Foundation

struct GameModel: Decodable {
    var results: [Game]?
    var next: String?
}

struct Game: Decodable, Equatable {
    static func == (lhs: Game, rhs: Game) -> Bool {
        return lhs.name == rhs.name
    }
    var id: Int?
    var slug: String?
    var name: String?
    var background_image: String?
    var rating: Double?
    var released: String?
    let genres: [Genres]?
    let short_screenshots: [ShortScreenShots]?
}

struct Genres: Decodable{
    let name: String?
}
struct ShortScreenShots: Decodable{
    let image: String?
}
