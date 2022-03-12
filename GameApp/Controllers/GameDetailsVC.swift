//
//  GameDetailsVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 7.03.2022.
//

import UIKit

class GameDetailsVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var metaCriticLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameImg: CustomImageView!
    
    //var request: GameDetailsRequest?
    
    var gameDetails: GameDetailsModel?
    var selectedGame: Game?
    var allGenre = ""
    var photos = [String]()
    var text = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for ss in (selectedGame?.short_screenshots)!{
            photos.append(ss.image!)
        }
        collectionView.delegate = self
        collectionView.dataSource = self
        
        gameDescriptionLabel.text = gameDetails?.description_raw
        let date = gameDetails?.released!.components(separatedBy: "-")
        dateLabel.text = "Release Date: \(date![2]).\(date![1]).\(date![0])"
        text = String((gameDetails?.metacritic) ?? 0)
        metaCriticLabel.text = "Meta Critic: " + text
        
        gameNameLabel.text = gameDetails?.name
        gameImg.loadImage(from: (gameDetails?.background_image)!)
        
        
        let genres = (gameDetails?.genres)!
        for genre in genres{
            allGenre += " \(genre.name!)"
        }
        genreLabel.text = "Genre: " + allGenre
        
        if FavoriteGame.sharedIntance.favoriteGames.contains(gameDetails!){
            favoriteButton.setImage(UIImage.init(systemName: "suit.heart.fill"), for: .normal)
        }else{
            favoriteButton.setImage(UIImage.init(systemName: "suit.heart"), for: .normal)
        }
        

        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSlide" {
            let destinationVC = segue.destination as! PhotoSlideVC
            destinationVC.selectedGame = selectedGame
        }
    }
    
    
    @IBAction func favoriteButtonClicked(_ sender: UIButton) {
        if FavoriteGame.sharedIntance.favoriteGames.contains(gameDetails!){
            let tempArray = FavoriteGame.sharedIntance.favoriteGames.filter{ $0 != gameDetails}
            FavoriteGame.sharedIntance.favoriteGames = tempArray
            favoriteButton.setImage(UIImage.init(systemName: "suit.heart"), for: .normal)
        }else{
            FavoriteGame.sharedIntance.favoriteGames.append(gameDetails!)
            FavoriteGame.sharedIntance.favoriteGameImages.append(selectedGame!)
            
            favoriteButton.setImage(UIImage.init(systemName: "suit.heart.fill"), for: .normal)
        }
        print(FavoriteGame.sharedIntance.favoriteGames)
       
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}

extension GameDetailsVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        cell.configure(img: photos[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 150, height: 150)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToSlide", sender: self)
    }
}
