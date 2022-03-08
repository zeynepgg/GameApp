//
//  GameListCell.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 6.03.2022.
//

import UIKit

class GameListCell: UICollectionViewCell {
    @IBOutlet weak var gameImg: CustomImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    func configure(model: Game) {
        self.gameNameLabel.text = model.name
        self.releaseDateLabel.text = model.released
        self.ratingLabel.text = "\(model.rating!)"
        //self.gameImg.loadFrom(URLAddress: model.background_image!)
        self.gameImg.loadImage(from: model.background_image!)
        
    }
    
    
}
