//
//  FeatureSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/26/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class FeatureSV: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var featureSVTableView: UITableView!
    @IBOutlet var numberOfResults: UILabel!
    
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
    
    
        
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        featureSVTableView.delegate = self
        featureSVTableView.dataSource = self
        
        numberOfResults.text = "Total Items: \(featureSVTitleCell.count)"
       
        
        
        
    }
//---------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return featureSVTitleCell.count
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
    
    
    
    
//---------------------------------------
}
