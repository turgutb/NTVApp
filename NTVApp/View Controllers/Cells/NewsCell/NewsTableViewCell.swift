


import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newDateLabel: UILabel!
    @IBOutlet weak var newTitleLabel: UILabel!
    
    
    public func configure(viewModel: ViewModel) {
        newDateLabel.text = viewModel.newDateText
        newTitleLabel.text = viewModel.newsNameText
        newImageView.kf.setImage(with: viewModel.newsImageURL)
    }
}

extension NewsTableViewCell {
    struct ViewModel {
        let newsNameText: String
        var newsImageURL: URL? = nil
        var newDateText: String
        
        init(item: Item) {
            newDateText = item.pubDate!
            newsNameText = item.title!
            if let url = item.thumbnail {
                newsImageURL = URL(string: url)
            }
        }
        
    }
}
