//
//  DetailTableViewCell.swift
//  NTVApp
//
//  Created by MacBook on 23.12.2020.
//  Copyright © 2020 Turgut. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var newsDetailTitleLabel: UILabel!
    @IBOutlet weak var newsDetailLabel: UILabel!
    @IBOutlet weak var newsDetailImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

extension DetailTableViewCell {
    struct ViewModel {
        let newsDetailText: String
        let newsDetailTitleText: String
        var newsImageURL: URL? = nil
        
        init(item: Item) {
            newsDetailText = item.description!
            newsDetailTitleText = item.title!
            if let url = item.thumbnail {
                newsImageURL = URL(string: url)!
            }
        }
        
    }
    
}
