//
//  CustomButton.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 3/10/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        
        layer.cornerRadius = 5.0
        layer.shadowColor = UIColor(displayP3Red: shadowColor, green: shadowColor, blue: shadowColor, alpha: 0.5).cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
    }

}
