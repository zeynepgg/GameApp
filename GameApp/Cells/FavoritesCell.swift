//
//  FavoritesCell.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 9.03.2022.
//

import UIKit

class FavoritesCell: UICollectionViewCell {
    @IBOutlet weak var gameImg: CustomImageView!
    
    @IBOutlet weak var gameNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(model: GameDetailsModel){
        self.gameNameLabel.text = model.name
        self.gameImg.loadImage(from: model.background_image!)
    }
    

}
