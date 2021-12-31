import Foundation
import UIKit

final class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var fetchMeal = finalMeal()
    var fetchMenu = finalMenu()
    
    var meal: Meals!
    var menus: Menus!
    
    var categories: Categories!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
        fetchMeal.parseMealData {
        //fetchMeals.parseMenuData {
            DispatchQueue.main.async {
                self.menuTableView.reloadData()
            }
        }
        
    }
    
    //MenuViewController Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMenu" {
            let destination = segue.destination as! DetailViewController
            let selectedIndexPath = menuTableView.indexPathForSelectedRow!
            destination.meal = fetchMeal.mealArray[selectedIndexPath.row]
            //destination.meals = fetchMeals.mealArray[selectedIndexPath.row]
            
        }
    }
}

extension MenuViewController: UITableViewDataSource {


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchMeal.mealArray.count
        //return fetchMeals.mealArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell", for: indexPath)
        cell.textLabel?.text = fetchMeal.mealArray[indexPath.row].strMeal
        //cell.textLabel?.text = fetchMeals.mealArray[indexPath.row].strMeal
        //cell.detailTextLabel?.text = fetchMeals.mealArray[indexPath.row].idMeal

        return cell
    }
}


extension MenuViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

    }
}
