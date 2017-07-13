//
//  BagModel.swift
//  (3.0)ShopVC
//
//  Created by E on 7/7/17.
//  Copyright © 2017 E. All rights reserved.
//

import Foundation


class BagModelData {
    
    private var _bagModelTitle = String()
    private var _bagModelPrice = String()
    
//---------------------------------------
    
    var bagModelTitle: String {
        return _bagModelTitle
    }
    
    var bagModelPrice: String {
        return _bagModelPrice
    }
    
    
//---------------------------------------
    
    init (Title: String, Price: String) {
        
        _bagModelTitle = Title
        _bagModelPrice = Price
        
    }
    
    
    
    
//---------------------------------------    
}
