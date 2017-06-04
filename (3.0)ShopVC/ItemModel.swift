//
//  ItemModel.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import Foundation


class ItemModelData {

    private var _itemModelTitle = [String]()
    private var _itemModelPrice = [String]()





//---------------------------------------

    var itemModelTitle: [String] {
        return _itemModelTitle
        }


    var itemModelPrice: [String] {
        return _itemModelPrice
        }









//---------------------------------------

    init (Title: [String], Price: [String]) {
        
        _itemModelTitle = Title
        _itemModelPrice = Price
        
        
        }

//---------------------------------------
}







