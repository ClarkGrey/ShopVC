//
//  FeatureSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/26/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

//Note: In the future try implementing multi-media for the feature image here, most likely it will be a 10 - 15 second clip that           plays in a loop. (Like iOS 11 App Store)

class FeatureSV: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var featureSVTableView: UITableView!
    @IBOutlet var numberOfResults: UILabel!
    
    //Not being used properly
    var myIndex = 0
    
    //Featured Cell
    var featureSVTitleCell = [String]()
    var featureSVSubTextCell = [String]()
    var featureSVImageCell = [String]()
    
    //Featured Item
    var featureSVTitle = String()
    var featureSVSubText1 = String()
    var featureSVSubText2 = String()
    var featureSVPrice = String()
    var featureSVImage = String()
    
    //ItmeSV Top View, FeatureSV Refrence
    var featureSVItemSVTitle = [String]()
    var featureSVItemSVPrice = [String]()
    
    //ItmeSV ScrollView, FeatureSV Refrence
    var featureSVItemSVScrollView = [[String]]()
    
    //ItmeSVDisplay
    var featureSVItemSVIDNumber = [String]()
    var featureSVItemSVQntyNumbers = [[Int]]()
    var featureSVItemSVType = [[String]]()
    
    //Title Cells
    var featureSVItemSVTitleCells = [[String]]()
    
    //SubSV (ItemSV TableView Cells)
    var featureSVSubSVItemCells = [[[String]]]()  //Added
  
        
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        featureSVTableView.delegate = self
        featureSVTableView.dataSource = self
        
        numberOfResults.text = "Items: \(featureSVTitleCell.count)"
       
        
        
        
    }
//---------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return featureSVTitleCell.count
        }
    
    //This line has no real affect or value, not like in the last view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeatureCell", for: indexPath) as! FeatureView
        
        //Featured Cell's
        cell.featureViewTitle.text = featureSVTitleCell[indexPath.row]
        cell.featureViewSubText.text = featureSVSubTextCell[indexPath.row]
        cell.featureViewImage.image = UIImage(named: featureSVImageCell[indexPath.row])
        
        //Featured Item
        cell.featureViewFTitle.text = featureSVTitle
        cell.featureViewFSubText1.text = featureSVSubText1
        cell.featureViewFSubText2.text = featureSVSubText2
        cell.featureViewFPrice.text = featureSVPrice
        cell.featureViewFImage.image = UIImage(named: featureSVImage)
        
        return cell
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let indexPath : NSIndexPath = self.browseSVTableView.indexPathForSelectedRow! as NSIndexPath
        
        //Setting FeatureSV with ItemSV refrences
        let indexPath : NSIndexPath = self.featureSVTableView.indexPathForSelectedRow! as NSIndexPath
        let destination = segue.destination as! ItemSV
        
        //ItemSV Top View
        destination.itemSVTitle = featureSVItemSVTitle[indexPath.row]
        destination.itemSVPrice = featureSVItemSVPrice[indexPath.row]
        
        //ItemSV ScrollView Image Array
        destination.itemSVImageArray = featureSVItemSVScrollView[indexPath.row]
       
        //Display
        destination.itemSVIDNumber = featureSVItemSVIDNumber[indexPath.row]
        destination.itemSVQntyNumbers = featureSVItemSVQntyNumbers[indexPath.row]
        destination.itemSVType = featureSVItemSVType[indexPath.row]
        
        //Title Cells
        destination.itemSVTitleCell = featureSVItemSVTitleCells[indexPath.row]
        
 
        //SubSV (ItemSV TableView Cells)
        destination.itemSVSubSVItemCells = featureSVSubSVItemCells[indexPath.row] //Added
       
        
        }
    
//---------------------------------------
}












