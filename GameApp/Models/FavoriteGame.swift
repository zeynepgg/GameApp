//
//  FavoriteGame.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 9.03.2022.
//

//MARK: singleton class

import Foundation
import UIKit

class FavoriteGame {
    static let sharedIntance = FavoriteGame()
    var favoriteGames = [GameDetailsModel]()
    var favoriteGameImages = [Game]()
    
}
