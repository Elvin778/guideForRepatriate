//
//  CustomTableViewCell2.swift
//  NavDrawMore
//
//  Created by Александр Туманов on 2/28/17.
//  Copyright © 2017 Александр Туманов. All rights reserved.
//

import UIKit

class CustomTableViewCell2: UITableViewCell {
    @IBOutlet weak var nameOfCompanyList: UILabel!

    @IBOutlet weak var imgSave: UIImageView!
    @IBOutlet weak var salaryList: UILabel!
    @IBOutlet weak var cityList: UILabel!
    @IBOutlet weak var professionlist: UILabel!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var thumbnailImageView: UIImageView!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var locationLabel: UILabel!
//    @IBOutlet weak var typeLabel: UILabel!
//    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
