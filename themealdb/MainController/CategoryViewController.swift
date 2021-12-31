import UIKit
import Foundation

/// An object responsible for some portion of an app's presentation logic.
final class CategoryViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var fetchCategory = Cate()
    //var meals: Meals!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        tableView.delegate = self
        tableView.dataSource = self
  
        fetchCategory.parseCategoryData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let destination = segue.destination as! MenuViewController
            let selectedIndexPath = tableView.indexPathForSelectedRow!
            destination.categories = fetchCategory.categoryArray[selectedIndexPath.row]
        }

    }
}


extension CategoryViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchCategory.categoryArray.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath)
        cell.textLabel?.text = fetchCategory.categoryArray[indexPath.row].strCategory
        cell.detailTextLabel?.text = "-"

        return cell
    }
}


extension CategoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
}
