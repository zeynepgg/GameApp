//
//  GameDetailsModel.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 7.03.2022.
//

import Foundation

struct GameDetailsModel: Decodable, Equatable {
    static func == (lhs: GameDetailsModel, rhs: GameDetailsModel) -> Bool {
        return lhs.name == rhs.name
    }
    
    var id: Int?
    var slug: String?
    var name: String?
    var description_raw: String?
    var metacritic: Int?
    var background_image: String?
    var released: String?
    var genres: [Genre]?
}

struct Genre: Decodable{
    let name: String?
}
