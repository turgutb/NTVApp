


import UIKit

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newDateLabel: UILabel!
    @IBOutlet weak var newTitleLabel: UILabel!
    
    func prepareForDrawing(new: New) {
        newDateLabel.text = new.pubDate
        newTitleLabel.text = new.title
        let url = URL(string: new.thumbnail!)
        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url!, options: [])

            //4. Make image
            image = UIImage(data: data)
        newImageView.image = image
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
