//
//  CategoryCell.swift
//  coder-swag
//
//  Created by Shubham Gupta on 28/09/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!
    
    func updateViews(category:Category){
        categoryImage.image = UIImage(named:category.imageName)
        categoryTitle.text = category.title
    }

}
