//
//  ProductCell.swift
//  coder-swag
//
//  Created by Shubham Gupta on 01/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var productImage : UIImageView!
    @IBOutlet weak var productTitle : UILabel!
    @IBOutlet weak var productPrice : UILabel!
    
    func updateProduct(product:Product){
        productTitle.text = product.title
        productPrice.text = product.price
        productImage.image = UIImage(named: product.imageName)
    }
}
