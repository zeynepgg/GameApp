//
//  ViewController.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 5.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = games[indexPath.row].name
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    var games = [Game](){
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    let gameListRequest = GameListRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
        gameListRequest.getGames { result in
            do {
                self.games = try result.get().results!
                
            }catch let error {
                print(error)
            }
        }
        
        
       
            
            /*
            switch result {
            case .success(let games):
                self.games = games
            case .failure(let error):
             print(error.localizedDescription)
            }*/
        
        
       
     
    

    }


}

