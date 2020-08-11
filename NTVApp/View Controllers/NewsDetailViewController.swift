

import UIKit
import SafariServices

class NewsDetailViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newTitleLabel: UILabel!
    @IBOutlet weak var newDescriptionLabel: UILabel!
    @IBOutlet weak var newBacksceneTitleLabel: UILabel!
   
    
    
    // MARK: - Stored Properties
    var new: Item!
    var readNews = [Item]()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newImageView.image = getImageFromUrl(url: new.thumbnail!)
        newTitleLabel.text = new.title
        newDescriptionLabel.text = new.description
        
    }
    
    // MARK: - Functions
    func showAlert() {
        let title = "Haber 'Okunan Haberler' listesine eklendi"
        let message = "Gezinmeye Devam Et"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Devam Et", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    func getImageFromUrl(url: String) -> UIImage? {
        let url = URL(string: url)
        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url!, options: [])
            
            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return image
    }
    
    // MARK: - Actions
    
    @IBAction func goToNewsSelf (_ sender: UIButton) {
        let url = URL(string: new.link!)
        let controller = SFSafariViewController(url: url!)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func markAsReadButtonTapped(_ sender: UIButton) {
        let item = new
        readNews.append(item!)
        showAlert()
    }
    
    @IBAction func addList(_ sender: Any) {
        
    }
    
}
