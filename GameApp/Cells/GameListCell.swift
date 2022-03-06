//
//  GameListCell.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 6.03.2022.
//

import UIKit

class GameListCell: UICollectionViewCell {
    @IBOutlet weak var gameImg: UIImageView!
    
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    func configure(model: Game) {
        self.gameNameLabel.text = model.name
        self.releaseDateLabel.text = model.released
        self.ratingLabel.text = "\(model.rating!)"
        self.gameImg.loadFrom(URLAddress: model.background_image!)
    }
}
