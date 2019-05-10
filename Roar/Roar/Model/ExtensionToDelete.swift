//
//  ExtensionToDelete.swift
//  Roar
//
//  Created by Matt on 09/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class ExtensionToDelete: UIView {

    
    let blackView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        blackView.backgroundColor = .black
        
        addSubview(blackView)
        
        
        //Simple code which you need to type every single:)
        
        //Enable auto layout
        blackView.translatesAutoresizingMaskIntoConstraints = false
        
        blackView.topAnchor.constraint(equalTo: topAnchor)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   

}

extension UIView {
    
    }
