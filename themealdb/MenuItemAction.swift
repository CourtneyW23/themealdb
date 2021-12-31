import Foundation
import UIKit

final class MenuItemAction: CategoryProtocol {
    let title: String = "View Abilities"
    
    var image: UIImage? { UIImage(systemName: "photo" ) }
    
    func viewController(for category: Category) -> UIViewController {
        
        return ViewController.instance(for: category)
    }
}
