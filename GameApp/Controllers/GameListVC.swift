//
//  GameListVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 5.03.2022.
//

import UIKit

class GameListVC: UIViewController {

    @IBOutlet weak var gameListCollectionView: UICollectionView!
    @IBOutlet weak var slideCollectionView: UICollectionView!
    
    //var gameList = [GameModel]()
    
    var games = [Game](){
        didSet {
            DispatchQueue.main.async {
                self.gameListCollectionView.reloadData()
                self.slideCollectionView.reloadData()
            }
            for i in 0...2 {
                slideArray.append(games[i])
            }
        }
    }
    var slideArray = [Game]()
    
   
    
    let gameListRequest = GameListRequest()
    var selectedGame: Game?
    var gameDetails: GameDetailsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        slideCollectionView.delegate = self
        slideCollectionView.dataSource = self
        
        gameListCollectionView.delegate = self
        gameListCollectionView.dataSource = self
        
        gameListRequest.getGames { result in
            do {
                self.games = try result.get().results!
                
            }catch let error {
                print(error)
            }
        }
        
        //slideCollectionView.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGameDetails" {
            let destinationVC = segue.destination as! GameDetailsVC
            destinationVC.gameDetails = gameDetails
        }
    }
    


}

extension GameListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == slideCollectionView {
            return slideArray.count
        }else {
            return games.count - 3
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == slideCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameSlideCell", for: indexPath) as! GameSlideCell
            print("-----------------------\(indexPath.row)")
            
            cell.configure(model: slideArray[indexPath.row])
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameListCell", for: indexPath) as! GameListCell
            cell.configure(model: games[indexPath.row + 3])
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == slideCollectionView {
            //let bounds = slideCollectionView.bounds
            return CGSize(width: self.view.bounds.width, height: 150)
        }else {
            let bounds = collectionView.bounds
            return CGSize(width: self.view.bounds.width, height: bounds.width / 3)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == slideCollectionView {
            selectedGame = games[indexPath.row]
        }else {
            selectedGame = games[indexPath.row+3]
        }
        
        let gameDetailsRequest = GameDetailsRequest(slug: (selectedGame?.slug)!)
        gameDetailsRequest.getGameDetails{ result in
            do {
                print("Buradayım")
                self.gameDetails = try result.get()
                DispatchQueue.main.async {
                    /*let destinationVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameDetailsVC" )
                    self.present(destinationVC, animated: true, completion: nil)*/
                    self.performSegue(withIdentifier: "goToGameDetails", sender: self)
                }
                
            }catch let error {
                print(error)
            }
        }
        
    }
    
    
}
