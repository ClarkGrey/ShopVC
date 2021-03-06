//
//  BrowseSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/25/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class BrowseSV: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var browseSVTableView: UITableView!
    
    var browseSVTitle = [String]()
    var browseSVImages = [String]()
    
    //This is what was missing!, Very Important!
    var myIndex = 0
   
    //This is from FeatureModel
    var featureSVArray = [FeatureModelData]()
    
    //ItemSV User Interface
    var itemSVArray = [ItemModelData]()
    
    //SubSV
    var subSVArray = [SubModelData]()
    
    
    
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        browseSVTableView.dataSource = self
        browseSVTableView.delegate = self
        
        
        //BrowseSV catagories
        browseSVTitle = ["Amazon Echo", "Thermostat", "Smart DoorLocks", "Cameras",
                         "Energy", "Sensors"]
        browseSVImages = ["whiteAmazon Echo", "nestThermo copy", "kevoSmartLock (self)", "skyBellModern",
                         "2gigLightBulb", "door&WindowSensor"]
        
        
        //Loading FeatureSV by BrowseSV catagory
        featureSVArray = [
            
            FeatureModelData(title: "Amazon Echo - Alexa!", subText1: "Voice Interaction, Blah Blah,",
                             subText2: "2nd Generation", price: "", image: "amazon12",
                             titleCell: ["Amazon Echo - Alexa...", "Google Home", "Echo Dot"],
                             subTextCell: ["New!", "", ""],
                             imageCell: ["blackAmazonEcho", "GoogleHome", "echoDot"]),
            
            FeatureModelData(title: "Nest Thermostat", subText1: "Learning Thermostat, 3rd Generation,",
                             subText2: "Energy Efficient", price: "+ $6.00/month", image: "nest3",
                             titleCell: ["Nest 3rd Generation", "Lyric T5 Thermostat", "Smart Thermostat"],
                             subTextCell: ["New!", "", ""],
                             imageCell: ["nestThermo copy", "lyricT5Thermo", "2gigThermostat"]),
            
            FeatureModelData(title: "Smart Deadbolt", subText1: "Touch - Open, Voice Controlled,",
                             subText2: "2nd Generation", price: "+ $6.00/month", image: "kevoSmartLock",
                             titleCell: ["Kevo Smart Touch Deadbolt", "Smart Door Locks - Deadbolt", "Smart Door Locks – Lever "],
                             subTextCell: ["New!", "", ""],
                             imageCell: ["kevoSmartLock (self)", "deadBolt","2GIGSmartDoorKnob"]),
            
            FeatureModelData(title: "Doorbell Camera", subText1: "HD Live Video, Phone Notifications,",
                             subText2: "Built in Speaker & Microphone", price: "+ $8.00/month", image: "skyBellSelf",
                             titleCell: ["Doorbell Camera", "Indoor HD Wifi Camera ", "Outdoor Camera", "Outdoor Mini Dome",
                                         "Indoor Image Sensor"],
                             subTextCell: ["New!", "New!", "", "", ""],
                             imageCell: ["skyBellModern", "2GIG-CAM-100W", "alarmOutCamera", "2GIG-CAM-250P", "imageSensor"]),
            
            FeatureModelData(title: "Smart Light Bulbs", subText1: "Set Timmers, App Contolled,",
                             subText2: "Energy Efficient", price: "$40.00/ea.", image: "2gigLightBulb",
                             titleCell: ["Smart Light Bulbs", "Smart In-Wall Switches", "Smart In-Wall Outlets",
                                        "Minimote Remote", "Smart Plug-In Module", "Takeover Module"],
                             subTextCell: ["New!", "", "", "", "", ""],
                             imageCell: ["2gigLightBulb", "smartLightSwitch", "SmartWallOutlets", "MinimoteRemote",
                                         "Smart-Plug-Module", "TakeoverModule"]),
            
            FeatureModelData(title: "Door/Window Contact", subText1: "Thinner, More Durable,",
                             subText2: "Fast Wireless", price: "$25.00/ea.", image: "door&WindowSensor",
                             titleCell: ["Door/Window", "Motion Detector", "Smart Garage Door", "CO Detector (CO3)",
                                         "Glass Break Detector", "Smoke/Heat/Freeze Sensor", "4-Button Keyfob Remote",
                                         "Panic Button"],
                             subTextCell: ["", "", "", "", "", "", "", ""],
                             imageCell: ["door&WindowSensor", "MotionDetector", "SmartGarage", "CODetector", "GlassBreakDetector",
                                         "SmokeSensor", "KeyfobRemote", "PanicButton"])
                        ]
        
        
        
        
        itemSVArray = [
            
            ItemModelData(Title: ["Amazon Echo - Alexa", "Google Home", "Echo Dot"],
                          Price: ["+ $5.00/month", "+ $4.00/month", "+ $2.00/month"],
                          IDNumber: ["Division 034", "Division 016", "Division 048"],
                          ScrollViewImages: [["amazonFeature1", "whiteAmazon Echo", "blackAmazonEcho"],
                                              ["GoogleHome", "echoDot"],
                                              ["echoDotDetails4", "echoDotDetails", "echoDot4", "echoDot", "echoDot5"]],
                          QntyNumbers: [[1, 2, 3, 4 ,5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], [1, 2, 3], [1, 2, 3, 4]],
                          Types: [["Blue", "Grey", "White"], ["Orange", "Grey", "Bluew"], ["White", "Black", "Light Brown"]],
                          TitleCell: [["Tech Specs", "Frequently Asked Questions", "What's Included","Warranty & Installation"],
                                      ["Tech Specs", "Frequently Asked Questions", "What's Included", "Warranty & Installation"],
                                      ["Tech Specs", "Frequently Asked Questions", "What's Included", "Warranty & Installation"]]),
            
            
            
            ItemModelData(Title: ["Nest Thermostat", "Lyric T5 Thermostat", "Smart Thermostat"],
                           Price: ["+ $8.00/month", "+ $6.00/month", "+ $4.00/month"],
                           IDNumber: ["R: 300018378", "R: 200018400", "R: 100018600"],
                           ScrollViewImages: [["nestSpecs", "nestThermo copy", "nestBlue"],
                                              ["lyricT5Thermo", "nestThermo copy", "lyricT5Thermo", "2gigThermostat"],
                                              ["2gigThermostat", "whiteAmazon Echo", "blackAmazonEcho"]],
                           QntyNumbers: [[1, 2], [1, 2], [1, 2]],
                           Types: [["", "", ""], ["", "", ""], ["", "", ""]],
                           TitleCell: [["Tech Specs", "Frequently Asked Questions", "What's Included","Warranty & Installation"],
                                       ["Tech Specs", "Frequently Asked Questions", "What's Included", "Warranty & Installation"],
                                       ["Tech Specs", "Frequently Asked Questions", "What's Included", "Warranty & Installation"]]),
            
            
            ]
        
        
        //(ItemSV TableView Cells)
        subSVArray = [
            
            SubModelData(ItemCellImages: [
                [["amazonFeature1", "amazonFeature1", "", ""], ["blackAmazonEcho", ""], ["whiteAmazon Echo", "blackAmazonEcho"]],
                [["amazonFeature1", "amazonFeature1", ""], ["blackAmazonEcho", "", ""], ["whiteAmazon Echo", "blackAmazonEcho"]],
                [["gold8", "whiteAmazon Echo"], ["blackAmazonEcho", "whiteAmazon Echo", "nestBlue", ""], ["whiteAmazon Echo", "blackAmazonEcho"]]
                ]),
            
            SubModelData(ItemCellImages: [
                [["amazonFeature1", "amazonFeature1", "", ""], ["blackAmazonEcho", ""], ["whiteAmazon Echo", "blackAmazonEcho"]],
                [["amazonFeature1", "amazonFeature1", "", ""], ["blackAmazonEcho", ""], ["whiteAmazon Echo", "blackAmazonEcho"]],
                [["amazonFeature1", "amazonFeature1", "", ""], ["blackAmazonEcho", ""], ["whiteAmazon Echo", "blackAmazonEcho"]]
                ])
            
            ]
        
       
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            //self.navigationItem.rightBarButtonItem = self.editButtonItem
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
    
    //This function is very important for this view controller
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Setting ItemModel with FeatureSV refrences
        let indexPath : NSIndexPath = self.browseSVTableView.indexPathForSelectedRow! as NSIndexPath
        let destination = segue.destination as! FeatureSV
        let featureModel : FeatureModelData
        featureModel = featureSVArray[indexPath.row] //featureSVArray might not be the best accurate refrence
        
        //Featured Cell
        destination.featureSVTitleCell = featureModel.featureModelTitleCell
        destination.featureSVSubTextCell = featureModel.featureModelSubTextCell
        destination.featureSVImageCell = featureModel.featureModelImageCell
        
        //Featured Item
        destination.featureSVTitle = featureModel.featureModelTitle
        destination.featureSVSubText1 = featureModel.featureModelSubText1
        destination.featureSVSubText2 = featureModel.featureModelSubText2
        destination.featureSVPrice = featureModel.featureModelPrice
        destination.featureSVImage = featureModel.featureModelImage
        
        //----------------------------------------------------------------
        
        //Setting ItemModel with FeatureSV refrences
        let itemModel : ItemModelData
        itemModel = itemSVArray[indexPath.row]
        
        //Top View
        destination.featureSVItemSVTitle = itemModel.itemModelTitle
        destination.featureSVItemSVPrice = itemModel.itemModelPrice
        
        //ScrollView Image Array
        destination.featureSVItemSVScrollView = itemModel.itemModelScrollView
        
        //Display
        destination.featureSVItemSVIDNumber = itemModel.itemModelIDNumber
        destination.featureSVItemSVQntyNumbers = itemModel.itemModelQntyNumbers
        destination.featureSVItemSVType = itemModel.itemModelType
        
        //Title Cells
        destination.featureSVItemSVTitleCells = itemModel.itemModelTitleCell
        
        //----------------------------------
        
        //SubSV (ItemSV TableView Cells)
        let subModel : SubModelData
        subModel = subSVArray[indexPath.row]
        
        destination.featureSVSubSVItemCells = subModel.itemModelItemCells
        
        
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





