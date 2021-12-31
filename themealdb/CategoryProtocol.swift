import UIKit
import Foundation

protocol CategoryProtocol: AnyObject {
        
    var title: String { get }
    
    var image: UIImage? { get }
    
    func viewController(for category: Category) -> UIViewController
}
