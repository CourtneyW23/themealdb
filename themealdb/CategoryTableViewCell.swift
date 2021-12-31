import UIKit


final class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var titleLabel: UILabel!
    
    @IBOutlet private weak var detailLabel: UILabel!
   
    var title: String? {
        titleLabel.text
    }
    
    var detail: String? {
        detailLabel.text
    }
}

extension CategoryTableViewCell {
    func setup(meal: Category){
        titleLabel.text = meal.title
        detailLabel.text = meal.detail
      
    }
}


