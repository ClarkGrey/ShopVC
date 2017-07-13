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
    private var _itemModelScrollView = [[String]]()

    //Display
    private var _itemModelIDNumber = [String]()
    private var _itemModelQntyNumbers = [[Int]]()
    private var _itemModelType = [[String]]()
    
    //item Title Cell
    private var _itemModelTitleCell = [[String]]()
    
    //Item TableView Cells
    //private var _itemModelTechSpecs = [[String]]()
    //private var _itemModelFAQ = [[String]]()
    //private var _itemModelWhatsIncluded = [[String]]()
    //private var _itemModelWarrantyAndInstallation = [[String]]()
    
    
//---------------------------------------
    
    //For Top View
    var itemModelTitle: [String] {
        return _itemModelTitle
    }
    
    var itemModelPrice: [String] {
        return _itemModelPrice
    }
    
    
    //For ScrollView
    var itemModelScrollView: [[String]] {
        return _itemModelScrollView
    }

    //Display
    var itemModelIDNumber: [String] {
        return _itemModelIDNumber
    }
    
    var itemModelQntyNumbers: [[Int]] {
        return _itemModelQntyNumbers
    }

    var itemModelType: [[String]] {
        return _itemModelType
    }
    
    //item Title Cell
    var itemModelTitleCell: [[String]] {
        return _itemModelTitleCell
    }
    
    
    //Item TableView Cells
    /*
    var itemModelTechSpecs: [[String]] {
        return _itemModelTechSpecs
    }
    
    var itemModelFAQ: [[String]] {
        return _itemModelFAQ
    }
    */
    
//---------------------------------------

    init (Title: [String], Price: [String], IDNumber: [String], ScrollViewImages: [[String]], QntyNumbers: [[Int]], Types: [[String]], TitleCell: [[String]]/*, TechSpecs: [[String]], FAQ: [[String]]*/) {
    
        _itemModelTitle = Title
        _itemModelPrice = Price
        _itemModelIDNumber = IDNumber
        _itemModelScrollView = ScrollViewImages
        _itemModelQntyNumbers = QntyNumbers
        _itemModelType = Types
        _itemModelTitleCell = TitleCell
        /*
        _itemModelTechSpecs = TechSpecs
        _itemModelFAQ = FAQ
        */
        }

//---------------------------------------
}







