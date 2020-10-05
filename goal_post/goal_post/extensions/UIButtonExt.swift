//
//  UIButtonExt.swift
//  goal_post
//
//  Created by Shubham Gupta on 04/10/20.
//  Copyright © 2020 Shubham Gupta. All rights reserved.
//

import UIKit

extension UIButton{
    func setSelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    func setDelectedColor(){
        self.backgroundColor = #colorLiteral(red: 0.2039215686, green: 0.7803921569, blue: 0.3490196078, alpha: 0.5)
        
    }
}
