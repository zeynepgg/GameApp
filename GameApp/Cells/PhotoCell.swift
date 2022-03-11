//
//  photoCell.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 11.03.2022.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    @IBOutlet weak var photo: CustomImageView!
    
    func configure(img: String){
        photo.loadImage(from: img)
    }
}
