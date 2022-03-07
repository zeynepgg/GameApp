//
//  GameDetailsRequest.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 7.03.2022.
//

import Foundation

enum GameDetailsError: Error {
    case noDataAvailable
    case canNotProcessData
}
struct GameDetailsRequest {
    let resourceURL: URL
    
    init(slug: String){
        print("slug:\(slug)")
        
        let gameDetailsString = "https://api.rawg.io/api/games/\(slug)?key=9718fac0b2cd44f5958788cabc198237"
       
        
        //MARK: 1. Create URL
        guard let gameDetails = URL(string: gameDetailsString) else {
            fatalError("Error")
        }
        self.resourceURL = gameDetails
    }
    
    func getGameDetails(completion: @escaping(Result<GameDetailsModel, GameDetailsError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let jsonData = data else {
                print("çekilemedi")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let details = try decoder.decode(GameDetailsModel.self, from: jsonData)
                completion(.success(details))
                print("başarılı")
            }catch{
                print("json decode errror")
            }
        }
        dataTask.resume()
    }
}
