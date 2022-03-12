//
//  ConfirmVC.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 12.03.2022.
//

import UIKit

protocol FavoriteDelegate {
    func sendChoose(choose: Bool)
}
class ConfirmVC: UIViewController {
    
    var delegate: FavoriteDelegate?
    var choose = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func yesButtonClicked(_ sender: UIButton) {
        choose = true
        self.delegate?.sendChoose(choose: choose)
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        choose = false
        self.delegate?.sendChoose(choose: choose)
        self.dismiss(animated: true, completion: nil)
    }
}
