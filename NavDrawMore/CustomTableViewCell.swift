//
//  CustomTableViewCell.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 2/28/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imgItem: UIImageView!
    @IBOutlet weak var menuItemLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
//        "Поиск работы", "Все вакансии", "Личный кабинет"
        if (menuItemLabel.text?.contains("Личный кабинет"))! {
            imgItem.image = UIImage(named: "List-50")
        }
        // Initialization code
    }
    
    
    


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
