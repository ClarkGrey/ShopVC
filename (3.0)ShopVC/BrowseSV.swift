//
//  BrowseSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/25/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class BrowseSV: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var browseSVTitle = [String]()
    var browseSVImages = [String]()
    
    @IBOutlet var browseSVTableView: UITableView!
   
    //This is from FeatureModel
    var featureSVArray = [FeatureModelData]()
    var myIndex = 0     //This is what was missing!, Very Important
    
    
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        browseSVTableView.dataSource = self
        browseSVTableView.delegate = self
        
        //BrowseSV catagories
        browseSVTitle = ["Amazon Echo", "Thermostat", "Smart DoorLocks", "Cameras",
                         "Lights & Modules", "Extra Sensors"]
        browseSVImages = ["echoIcon", "thermoIcon", "yaleDoorLock", "camIcon",
                         "blueLightBulb", "sensorIcon"]
        
        //Loading FeatureSV by BrowseSV catagory
        featureSVArray = [
            
            FeatureModelData(title: "Amazon Echo - Alexa!", subText1: "Voice Interaction, Blah Blah,",
                             subText2: "2nd Generation", price: "+ $5.00/month",
                             image: "blackAmazonEcho", titleCell: ["Amazon Echo - Alexa!", "Echo Dot"],
                             subTextCell: ["New!", "Free!"],
                             imageCell: ["blackAmazonEcho", "echoDot"]),
            
            FeatureModelData(title: "Nest Thermostat", subText1: "Learning Thermostat, 3rd Generation,",
                             subText2: "Energy Efficient", price: "+ $7.00/month",
                             image: "nest3", titleCell: ["Nest 3rd Generation Thermostat","Smart Thermostat"],
                             subTextCell: ["New!", ""], imageCell: ["nestBlue", "2gigThermostat"]),
            
            FeatureModelData(title: "Smart Deadbolt", subText1: "Wireless, Phone Accessed,",
                             subText2: "More Secured", price: "+ $5.00/month",
                             image: "deadBolt", titleCell: ["Smart Deadbolt", "Finger Print Door Locks"],
                             subTextCell: ["", ""], imageCell: ["",""]),
            
            FeatureModelData(title: "Doorbell Camera", subText1: "HD Live Video, Phone Notifications", subText2: "Built in Speaker & Microphone", price: "+ $8.00/month",
                             image: "skyBellSelf", titleCell: ["Doorbell Camera", "Indoor Camera", "Outdoor Camera"],
                             subTextCell: ["New!", "", ""], imageCell: ["", "", ""]),
            
            FeatureModelData(title: "wrwr", subText1: "asfgf", subText2: "asfg", price: "8.00",
                             image: "blackAmazonEcho", titleCell: [""], subTextCell: [""], imageCell: [""]),
            
            FeatureModelData(title: "sdafg", subText1: "asfgf", subText2: "asfg", price: "8.00",
                             image: "blackAmazonEcho", titleCell: [""], subTextCell: [""], imageCell: [""])
            
            ]
        
        
       
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
//---------------------------------------

    // MARK: - Table view data source

    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return browseSVTitle.count
        }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BrowseCell", for: indexPath) as! BrowseView
        cell.browseViewImage.image = UIImage(named: browseSVImages[indexPath.row])
        cell.browseViewTitle.text = browseSVTitle[indexPath.row]
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath : NSIndexPath = self.browseSVTableView.indexPathForSelectedRow! as NSIndexPath
        let destination = segue.destination as! FeatureSV
        let featureModel : FeatureModelData
        featureModel = featureSVArray[indexPath.row] //SV refrence might not be an accurate refrence
        
        destination.featureSVTitleCell = featureModel.featureModelTitleCell
        destination.featureSVSubTextCell = featureModel.featureModelSubTextCell
        destination.featureSVImageCell = featureModel.featureModelImageCell
        
        //Featured Item
        destination.featureSVTitle = featureModel.featureModelTitle
        destination.featureSVSubText1 = featureModel.featureModelSubText1
        destination.featureSVSubText2 = featureModel.featureModelSubText2
        destination.featureSVPrice = featureModel.featureModelPrice
        destination.featureSVImage = featureModel.featureModelImage
        
        }
    
    
    
    
   
    
//---------------------------------------
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */
    

//---------------------------------------
}
