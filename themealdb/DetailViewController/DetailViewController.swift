import UIKit

final class DetailViewController: UIViewController {
    
    @IBOutlet weak var menuNameLabel: UILabel!
    @IBOutlet weak var instructionsLabel: UILabel!
    
    @IBOutlet weak var instructTextView: UITextView!
    @IBOutlet weak var ingredientsLabel: UILabel!
    
    @IBOutlet weak var ingredientTextView: UITextView!
    
    var menus: Menus!
    var meal: Meals!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        updateUserInterface()
    }

    func updateUserInterface() {
        menuNameLabel?.text = menus?.strMeal
        instructTextView.text = menus?.strInstructions
        //ingredientTextView.text = meals?.strIngredient1
    }
}
