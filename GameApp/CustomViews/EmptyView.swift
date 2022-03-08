//
//  EmptyView.swift
//  GameApp
//
//  Created by Zeynep Gizem Gürsoy on 8.03.2022.
//

import UIKit

class EmptyView: UIView {
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(){
        let bundle = Bundle.init(for: EmptyView.self)
        if let viewToAdd = bundle.loadNibNamed("EmptyView", owner: self, options: nil), let contentView = viewToAdd.first as? UIView {
            addSubview(contentView)
            contentView.frame = self.bounds
        }
    }
}
