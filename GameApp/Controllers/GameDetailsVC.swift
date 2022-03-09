//
//  GameDetailsVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 7.03.2022.
//

import UIKit

class GameDetailsVC: UIViewController {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameImg: UIImageView!
    
    //var request: GameDetailsRequest?
    
    var gameDetails: GameDetailsModel?
    var selectedGame: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDescriptionLabel.text = gameDetails?.description_raw
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        if FavoriteGame.sharedIntance.favoriteGames.contains(gameDetails!){
            let tempArray = FavoriteGame.sharedIntance.favoriteGames.filter{ $0 != gameDetails}
            FavoriteGame.sharedIntance.favoriteGames = tempArray
        }else{
            FavoriteGame.sharedIntance.favoriteGames.append(gameDetails!)
        }
        print(FavoriteGame.sharedIntance.favoriteGames)
       
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
