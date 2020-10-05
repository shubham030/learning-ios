//
//  CategoryModel.swift
//  coder-swag
//
//  Created by Shubham Gupta on 30/09/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import Foundation
struct Category{
    public private(set) var title:String!
    public private(set) var imageName:String!
    
    init(title:String,imageName:String){
        self.title = title
        self.imageName = imageName
    }
    
}
