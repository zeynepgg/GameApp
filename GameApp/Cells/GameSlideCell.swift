//
//  GameCell.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 5.03.2022.
//

import UIKit

class GameSlideCell: UICollectionViewCell {
    @IBOutlet weak var slideImageView: CustomImageView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var gameNameLabel: UILabel!
    
    func configure(model: Game) {
        self.gameNameLabel.text = model.name
        self.slideImageView.loadImage(from: model.background_image!)
        self.starLabel.text = String(repeating: " ⭐", count: Int(model.rating!))
    }
}
