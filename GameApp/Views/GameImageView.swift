//
//  GameImageView.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 8.03.2022.
//

import UIKit
import Foundation

class GameImageView: UIImageView {
    var lastURL = ""
    
    func loadFrom(URLAddress: String) {
        lastURL = URLAddress
        
        guard let url = URL(string: URLAddress) else {
            return
        }
        
        DispatchQueue.global().async {
            if let imageData = try? Data(contentsOf: url) {

                if let loadedImage = UIImage(data: imageData) {
                    DispatchQueue.main.async { [weak self] in
                        if self!.lastURL == URLAddress {
                            self?.image = loadedImage
                        }else{
                            return
                        }
                         
                    }
                       
                }
            }
        }
    }

}
