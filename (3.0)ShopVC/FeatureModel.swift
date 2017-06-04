//
//  FeatureModel.swift
//  (3.0)ShopVC
//
//  Created by E on 5/26/17.
//  Copyright © 2017 E. All rights reserved.
//

import Foundation

class FeatureModelData {
    
    //This will be implemented in BrowseSV to prepare for FeatureSV
    
    //Featured Cell
    private var _featureModelTitleCell = [String]()
    private var _featureModelSubTextCell = [String]()
    private var _featureModeImageCell = [String]()
    
    //Featured Item
    private var _featureModelTitle = String()
    private var _featureModelSubText1 = String()
    private var _featureModelSubText2 = String()
    private var _featureModePrice = String()
    private var _featureModeImage = String()
    
    
//---------------------------------------
    
    //Featured Cell
    var featureModelTitleCell: [String] {
        return _featureModelTitleCell
        }
    
    var featureModelSubTextCell: [String] {
        return _featureModelSubTextCell
        }
    
    var featureModelImageCell: [String] {
        return _featureModeImageCell
        }
    
    
    //Featured Item
    var featureModelTitle: String {
        return _featureModelTitle
        }
    
    var featureModelSubText1: String {
        return _featureModelSubText1
        }
    
    var featureModelSubText2: String {
        return _featureModelSubText2
        }
    
    var featureModelPrice: String {
        return _featureModePrice
        }
    
    var featureModelImage: String {
        return _featureModeImage
        }
    
//---------------------------------------
    
    init (title: String, subText1: String, subText2: String, price: String, image: String, titleCell: [String],
          subTextCell: [String], imageCell: [String]) {
     
        //Featured Cell
        _featureModelTitleCell = titleCell
        _featureModelSubTextCell = subTextCell
        _featureModeImageCell = imageCell
        
        //Featured Item
        _featureModelTitle = title
        _featureModelSubText1 = subText1
        _featureModelSubText2 = subText2
        _featureModePrice = price
        _featureModeImage = image
        }
    
    
//---------------------------------------    
}










