

import UIKit

class ListViewController: UIViewController {
    // MARK: - UI Elements
   
   
    @IBOutlet weak var listTableView: UITableView!
    
    
    
    // MARK: - Stored Properties
    var list = [String]()
    var listName: String?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Functions
    override func viewWillAppear(_ animated: Bool) {
        self.listTableView.rowHeight = 100
    }
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Yeni oluşturacağınız listeye bir isim verin", message: nil, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Liste Adı"
        }
        let action1 = UIAlertAction(title: "Oluştur", style: .default) { (UIAlertAction) in
            let textfield = alert.textFields![0] as UITextField
            self.listName = textfield.text
            self.list.append(self.listName!)
            DispatchQueue.main.async {
                self.listTableView.reloadData()
            }
        }
        let action2 = UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
 
    
    @IBAction func newListAddButtonTapped(_ sender: UIBarButtonItem) {
        showAlert()
    }
   
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListsCell") as? ListsTableViewCell {
            cell.listNameLabel.text = list[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(80)
        return height
    }
    
    
}


    
    

