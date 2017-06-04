//
//  ItemModel.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import Foundation


class ItemModelData {

    private var _itemSVTitle = [String]()
    private var _itemSVPrice = [String]()





//---------------------------------------

    var itemSVlTitle: [String] {
        return _itemSVTitle
    }


    var itemSVlPrice: [String] {
        return _itemSVPrice
    }









//---------------------------------------

    init (Title: [String], Price: [String]) {
        
        _itemSVTitle = Title
        _itemSVPrice = Price
        
        
        
        
    }













//---------------------------------------
}







