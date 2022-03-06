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
                tempArray.append(games[i])
            }
        }
    }
    var tempArray = [Game]()
    
    
    let gameListRequest = GameListRequest()
    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension GameListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == slideCollectionView {
            return tempArray.count
        }else {
            return games.count
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == slideCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameSlideCell", for: indexPath) as! GameSlideCell
            print("-----------------------\(indexPath.row)")
            
            cell.configure(model: tempArray[indexPath.row])
            
            return cell
        }else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GameListCell", for: indexPath) as! GameListCell
            cell.configure(model: games[indexPath.row])
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
    
    
}
