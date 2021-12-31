import UIKit
import Foundation

class Cate {
   
    var categoryArray: [Categories] = []
    let urlString = "https://www.themealdb.com/api/json/v1/1/categories.php"

func parseCategoryData(completed: @escaping () -> ()) {

    
    guard let url = URL(string: urlString) else {
        print("error")
        completed()
        return
    }

    let session = URLSession.shared
    let task = session.dataTask(with: url) {data, response, error in
        if let error = error {
            print("Error \(error.localizedDescription)")
        }
       
            do {
                let decoder = JSONDecoder()
                let fetchedCategoryData = try decoder.decode(Category.self, from: data!)
                self.categoryArray = fetchedCategoryData.categories
                
                  
        } catch {
            print(error)
        }
        completed()        
    }
    task.resume()
    }
}

class finalMenu {

    var menuArray: [Menus] = []
    
   
    let urlString = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=52770"

func parseMenuData(completed: @escaping () -> ()) {

    
    guard let url = URL(string: urlString) else {
        print("error")
        completed()
        return
    }

    let session = URLSession.shared
    let task = session.dataTask(with: url) {data, response, error in
        if let error = error {
            print("Error \(error.localizedDescription)")
        }
       
            do {
                let decoder = JSONDecoder()
                let fetchedMenuData = try decoder.decode(Menu.self, from: data!)
                self.menuArray = fetchedMenuData.menus
                  
            } catch{
            print(error)
        }
        completed()
    }
    task.resume()
    }
}

class finalMeal {
   
    var mealArray: [Meals] = []
    let urlString = "https://www.themealdb.com/api/json/v1/1/filter.php?c=BEEF"

func parseMealData(completed: @escaping () -> ()) {

    
    guard let url = URL(string: urlString) else {
        print("error")
        completed()
        return
    }

    let session = URLSession.shared
    let task = session.dataTask(with: url) {data, response, error in
        if let error = error {
            print("Error \(error.localizedDescription)")
        }
       
            do {
                let decoder = JSONDecoder()
                let fetchedMealData = try decoder.decode(Meal.self, from: data!)
                self.mealArray = fetchedMealData.meal
                
                  
        } catch {
            print(error)
        }
        completed()
    }
    task.resume()
    }
}
