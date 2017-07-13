//
//  SubModel.swift
//  (3.0)ShopVC
//
//  Created by E on 7/10/17.
//  Copyright © 2017 E. All rights reserved.
//

import Foundation


class SubModelData {
    
    private var _itemModelItemCells = [[[String]]]()
 
    
//---------------------------------------
    
    var itemModelItemCells: [[[String]]] {
        return _itemModelItemCells
    }
    
   
    
//---------------------------------------
    
    init (ItemCellImages: [[[String]]]) {
     
        _itemModelItemCells = ItemCellImages
       
        
    }
   
    
    
//---------------------------------------
}
