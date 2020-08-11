

import UIKit

class CategoriesViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var categoryTableView: UITableView!

    
    
    
    // MARK: - Stored Properties
    var selectedCategory: String?
    var rssPath: String?
    var root: Root?
    var categories = ["Sanat","Otomobil","Ekonomi","Eğitim","Sağlık","Seyahat","Yaşam","Teknoloji","Türkiye","Gündem","Dünya"]
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Functions
    
    
    
    // MARK: - Actions
    
}


extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoriesCell", for: indexPath) as? CategoriesTableViewCell {
            cell.categoryNameLabel?.text = categories[indexPath.row]
            cell.categoryImageView?.image = UIImage(named: categories[indexPath.row])
            
            return cell
        }
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        performSegue(withIdentifier: "unwindToNews", sender: nil)
    }
}
