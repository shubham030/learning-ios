//
//  ProductsVCViewController.swift
//  coder-swag
//
//  Created by Shubham Gupta on 01/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

class ProductsVC: UIViewController, UICollectionViewDelegate,UICollectionViewDataSource {
    
    
    private(set) public var products = [Product]()
    
    @IBOutlet weak var productsCollection:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollection.delegate = self
        productsCollection.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func initProducts(category:Category){
        products = DataService.instance.getProducts(forCategoryTitle: category.title)
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCell{
            let product = products[indexPath.row]
            cell.updateProduct(product: product)
            return cell
        }else{
            return ProductCell()
        }
    }

}
