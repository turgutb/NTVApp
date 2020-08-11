

import UIKit

class NewsViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var newTypeLabel: UILabel!
    @IBOutlet weak var newCountLabel: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    
    // MARK: - Stored Properties
    var url: String?
    var news = [Item]()
    let storage = UserDefaults.standard
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/gundem.rss"
        getNewFromRss(url: url!)
        newTypeLabel.text = "Gündem"
        
        
    }
    
   
    // MARK: - Functions
    
    func getNewFromRss (url: String) {
        if let rssUrl = URL(string: url) {
            URLSession.shared.dataTask(with: rssUrl) { (data, response, error) in
                if let receivedData = data {
                    let decoder = JSONDecoder()
                    do {
                        let root = try decoder.decode(Root.self, from: receivedData)
                        self.news = root.items!
                        
                        DispatchQueue.main.async {
                            self.newsTableView.reloadData()
                            self.newCountLabel.text = "\(self.news.count) adet haber listeleniyor."
                        }
                        
                        let encoder = JSONEncoder()
                        do {
                            
                            let contactData = try encoder.encode(root)
                            self.storage.setValue(contactData, forKey: "thumbnail")
                            
                        } catch {
                            print(error)
                        }
                        
                    } catch {
                        print(error)
                    }
                }
                
                
            }.resume()
            
            
        }
    }
    
    func getImageFromUrl(url: String) -> UIImage? {
        let url = URL(string: url)
        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url!)
            
            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return image
    }
    
    // MARK: - Actions
    @IBAction func unwindSegueFromCategoryViewController(_ sender: UIStoryboardSegue) {
        if let source = sender.source as? CategoriesViewController {
            switch source.selectedCategory {
            case "Sanat":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/sanat.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Sanat"
            case "Otomobil":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/otomobil.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Otomobil"
            case "Ekonomi":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/ekonomi.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Ekonomi"
            case "Eğitim":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/egitim.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Eğitim"
            case "Sağlık":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/saglik.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Sağlık"
            case "Seyahat":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/seyahat.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Seyahat"
            case "Yaşam":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/yasam.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Yaşam"
            case "Teknoloji":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/teknoloji.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Teknoloji"
            case "Türkiye":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/turkiye.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Türkiye"
            case "Gündem":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/gundem.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Gündem"
            case "Dünya":
                let url = "https://api.rss2json.com/v1/api.json?rss_url=https://www.ntv.com.tr/dunya.rss"
                getNewFromRss(url: url)
                newTypeLabel.text = "Dünya"
            default:
                break
            }
            
            
            
        }
    }
    
}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return news.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let new = news[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsTableViewCell {
            cell.newDateLabel.text = new.pubDate
            cell.newTitleLabel.text = new.title
            let imageUrl = new.thumbnail
            cell.newImageView.image = getImageFromUrl(url: imageUrl!)
            
            
            return cell
            
        }
        
        
        return UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let new = news[indexPath.row]
        performSegue(withIdentifier: "GoToNewDetails", sender: new)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToNewDetails" {
            if let destination = segue.destination as? NewsDetailViewController, let indexPath = self.newsTableView.indexPathForSelectedRow {
                let new = news[indexPath.row]
                destination.new = new
                
            }
            
        }
        
    }
    
    
}






