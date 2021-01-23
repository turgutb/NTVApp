//
//  CategoryTableViewCell.swift
//  NTVApp
//
//  Created by MacBook on 29.12.2020.
//  Copyright © 2020 Turgut. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setView (name: String) {
        categoryName.text = name
    }
    
}
