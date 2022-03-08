//
//  GameListRequest.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 6.03.2022.
//

import Foundation


enum GameListError: Error {
    case noDataAvailable
    case canNotProcessData
}
struct GameListRequest{
    
    let resourceURL: URL
    
    init(link: String){
        let gameListString = link
        
        //MARK: 1. Create URL
        guard let gameListURL = URL(string: gameListString) else {
            fatalError("Error")
        }
        self.resourceURL = gameListURL
        //performRequest(url: resourceURL)
    }
    
    func getGames(completion: @escaping(Result<GameModel, GameListError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, response, error in
            guard let jsonData = data else {
                print("çekilemedi")
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let games = try decoder.decode(GameModel.self, from: jsonData)
                completion(.success(games))
                print("başarılı")
            }catch{
                print("json decode errror")
            }
        }
        dataTask.resume()
    }
    /*
    func performRequest(url: URL){
        //MARK: 2. Create URLSession
        let session = URLSession(configuration: .default)
        
        
        //MARK: 3. Give the session a task
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil {
                print(error!)
                return
            }
            
            if let safeData = data {
                parseJSON(gameData: safeData)
            }
        }
        //MARK: 4. Start the task
        task.resume()
    }
    
    func parseJSON(gameData: Data) {
        let decoder = JSONDecoder()
        
        do{
            let decodedData = try decoder.decode(GameModel.self, from: gameData)
            //print(decodedData.results![0].name)
            
        } catch {
            print(error)
        }
        
    }
    
    */
    
   /*
    var request = NSMutableURLRequest()
    init(){
    let headers = [
        "x-rapidapi-host": "rawg-video-games-database.p.rapidapi.com",
        "x-rapidapi-key": "1187273bd9msh5d2c7222d41ad26p135996jsnddfe88409dda"
    ]

    request = NSMutableURLRequest(url: NSURL(string: "https://rawg-video-games-database.p.rapidapi.com/games/%7Bgame_pk%7D")! as URL,
                                            cachePolicy: .useProtocolCachePolicy,
                                        timeoutInterval: 10.0)
    request.httpMethod = "GET"
    request.allHTTPHeaderFields = headers
        
    }




    
    
    func getGameList(completion: @escaping(Result<GamesModel, GameListError>) -> Void) {
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            
            
            if error == nil && data != nil {
                let decoder = JSONDecoder()
                do {
                    let gameFeed = try decoder.decode(GamesModel.self, from: data!)
                    print(gameFeed)
                    completion(.success(gameFeed))
                }catch{
                    print(error)
                    completion(.failure(.canNotProcessData))
                }
            }
        })

        dataTask.resume()
    }
    */
    
}
