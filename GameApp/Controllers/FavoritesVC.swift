//
//  FavoritesVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 5.03.2022.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var selectedGame: GameDetailsModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "FavoritesCell", bundle: nil), forCellWithReuseIdentifier: "FavoritesCell")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToGameDetails" {
            let destinationVC = segue.destination as! GameDetailsVC
            destinationVC.gameDetails = selectedGame
        }
    }
    func setupEmptyBackgroundView(){
        let emptyBackgroundView = EmptyView()
        collectionView.backgroundView = emptyBackgroundView
    }
}

extension FavoritesVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if FavoriteGame.sharedIntance.favoriteGames.count == 0 {
            setupEmptyBackgroundView()
        }else {
            collectionView.backgroundView?.isHidden = true
        }
        return FavoriteGame.sharedIntance.favoriteGames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoritesCell", for: indexPath) as! FavoritesCell
        cell.configure(model: FavoriteGame.sharedIntance.favoriteGames[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let bounds = collectionView.bounds
        return CGSize(width: bounds.width - 10, height: bounds.height / 6)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedGame = FavoriteGame.sharedIntance.favoriteGames[indexPath.row]
        self.performSegue(withIdentifier: "goToGameDetails", sender: self)
    }
    
    
}
