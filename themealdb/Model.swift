import Foundation
import UIKit

struct Other: Decodable {
    let idCategory: Int?
    let strCategory: String?
    let strCategoryThumb: URL?
    let strCategoryDescription: String?
}

struct Category: Decodable {
    let categories: [Other]?
    
}

protocol ModelDelegate: AnyObject {
    
    // block UI
    func blockUI() // method definition
   
    // Display ability
    func display(category: Category)
    
    // Display error
    func display(error: Error)
}

final class Model {
    
    private let serviceClient: ServiceClient = ServiceClient()
    let items: [Item]
    
    weak var delegate: ModelDelegate?
    
    init(items: [Item]) {
        self.items = items
    }
    
    // Get Data from URL
    func userTapped(row: Int) {
        let item = items[row]
        
        delegate?.blockUI()
        serviceClient.get(from: item.url) { [weak self] result in
            do {
                let data = try result.get()
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                let category = try decoder.decode(Category.self, from: data)
               
                self?.delegate?.display(category: category)
                
            } catch {
                
                self?.delegate?.display(error: error)
            }
        }
    }
}
