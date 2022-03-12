//
//  UILabel Extension.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 12.03.2022.
//

import Foundation
import UIKit

extension UILabel{
    func changeDateFormat(str: String) {
        let date = str.components(separatedBy: "-")
        self.text = "Realese Date: \(date[2]).\(date[1]).\(date[0])"
    }
}
