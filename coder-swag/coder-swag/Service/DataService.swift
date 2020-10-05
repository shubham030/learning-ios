//
//  DataService.swift
//  coder-swag
//
//  Created by Shubham Gupta on 30/09/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import Foundation
class DataService{
    static let instance = DataService()
    
    private let categories = [
        Category(title:"SHIRTS",imageName:"shirts.png"),
        Category(title:"HOODIES",imageName:"hoodies.png"),
        Category(title:"HATS",imageName:"hats.png"),
        Category(title:"DIGITAL",imageName:"digital.png"),
    ]
    
    private let hats = [
        Product(title: "Graphic Bene", price: "$10", imageName: "hat01.png"),
        Product(title: "Hat Black", price: "$15", imageName: "hat02.png"),
        Product(title: "Hat White", price: "$20", imageName: "hat03.png"),
        Product(title: "Hat White", price: "$5", imageName: "hat04.png"),
    ]
    
    private let hoodies = [
        Product(title: "Hoodie Grey", price: "$50", imageName: "hoodie01.png"),
        Product(title: "Hoodie Red", price: "$50", imageName: "hoodie02.png"),
        Product(title: "Hoodie Grey", price: "$50", imageName: "hoodie03.png"),
        Product(title: "Hoodie Black", price: "$50", imageName: "hoodie04.png"),
    ]
    
    private let shirts = [
        Product(title: "Shirt Black", price: "$80", imageName: "shirt01.png"),
        Product(title: "Light Grey", price: "$80", imageName: "shirt02.png"),
        Product(title: "Red", price: "$80", imageName: "shirt03.png"),
        Product(title: "Hustle Delegate", price: "$80", imageName: "shirt04.png"),
        Product(title: "Studio Black ", price: "$80", imageName: "shirt05.png"),
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category]{
        return categories
    }
    
    func getProducts(forCategoryTitle category:String)->[Product]{
        switch category{
            case "SHIRTS":
           return getShirts()
        case "HOODIES":
            return getHoodies()
            
        case "HATS":
            return getHats()
        case "DIGITAL":
            return getDigitalGoods()
        default:
            return getShirts()
        }
        
    }
    
    func getHats()->[Product]{
        return hats
    }
    
    func getShirts()->[Product]{
        return shirts
    }
    
    func getHoodies()->[Product]{
        return hoodies
    }
    
    func getDigitalGoods()->[Product]{
        return digitalGoods
    }
        
}
