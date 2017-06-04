//
//  ItemSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class ItemSV: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var itemSVTableView: UITableView!
    @IBOutlet var itemSVScrollView: UIScrollView!
    
    //Item Cell's
    var itemSVTitleCell = [String]()
    
    var itemSVTitle = [String]()
    var itemSVPrice = [String]()
    
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        itemSVTableView.delegate = self
        itemSVTableView.dataSource = self
        
        
        itemSVTitleCell = ["Tech Specs", "Frequently Asked Questions", "What's Included",
                           "Warranty & Installation"]
        
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        }
//---------------------------------------
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemSVTitleCell.count
        }
    
    
    //Update, didSelectRow (maybe)
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemView
        
        //Item Cell's
        cell.itemViewTitleCell.text = itemSVTitleCell[indexPath.row]
        
        //Item View
        
        
        return cell
        }
    
    
    
    
    
    
    
    
    

//---------------------------------------
}















