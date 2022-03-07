//
//  GameDetailsVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 7.03.2022.
//

import UIKit

class GameDetailsVC: UIViewController {

    @IBOutlet weak var gameDescriptionLabel: UILabel!
    @IBOutlet weak var gameImg: UIImageView!
    
    var request: GameDetailsRequest?
    
    var gameDetails: GameDetailsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDescriptionLabel.text = gameDetails?.description_raw
        print(gameDetails?.name)
        

        // Do any additional setup after loading the view.
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
