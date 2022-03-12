//
//  ConfirmVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 12.03.2022.
//

import UIKit

protocol FavoriteDelegate {
    func sendYes(choose: Bool)
}
class ConfirmVC: UIViewController {
    
    var delegate: FavoriteDelegate?
    var choose = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func yesButtonClicked(_ sender: UIButton) {
        choose = true
        self.delegate?.sendYes(choose: choose)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        choose = false
        self.delegate?.sendYes(choose: choose)
        self.dismiss(animated: true, completion: nil)
    }
}
