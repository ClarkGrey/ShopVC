//
//  ItemModel.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import Foundation


class ItemModelData {
    
    //For Top View
    private var _itemModelTitle = [String]()
    private var _itemModelPrice = [String]()

    //For ScrollView
    private var _itemModelScrollView = [String]()


//---------------------------------------
    //For Top View
    var itemModelTitle: [String] {
        return _itemModelTitle
        }
    
    var itemModelPrice: [String] {
        return _itemModelPrice
        }
    
    
    //For ScrollView
    var itemModelScrollView: [String] {
        return _itemModelScrollView
        }







//---------------------------------------

    init (Title: [String], Price: [String], ScrollViewImages: [String]) {
        
        _itemModelTitle = Title
        _itemModelPrice = Price
        _itemModelScrollView = ScrollViewImages
        
        }

//---------------------------------------
}







