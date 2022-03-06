//
//  GameCell.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 5.03.2022.
//

import UIKit

class GameSlideCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
   // @IBOutlet weak var ratingStar: UIImageView!
    //@IBOutlet weak var gameReleaseDateLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    func configure(model: Game) {
        self.gameNameLabel.text = model.name
        //self.releaseDateLabel.text = model.released
        self.ratingLabel.text = "\(model.rating!)"
        self.slideImageView.loadFrom(URLAddress: model.background_image!)
    }
}
