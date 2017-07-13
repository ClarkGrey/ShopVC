//
//  BagVC.swift
//  (3.0)ShopVC
//
//  Created by E on 6/30/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class BagVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet var bagVCTableView: UITableView!
    
    var bagVCTableViewStrings = [String]()
    
    var bagVCTitleCell = String()
    var bagVCPriceCell = String()
    var bagVCImageCell = String()
    var bagVCDetailCell1 = String()
    var bagVCDetailCell2 = String()
    
    
    var bagVCArray = [BagModelData]()
    
    
    
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        
        bagVCTableView.delegate = self
        bagVCTableView.dataSource = self
        
        
        bagVCTableViewStrings = ["one"]
        
        bagVCTitleCell = "Amazon Echo Dot"
        bagVCPriceCell = "+ $2.00/Month"
        bagVCImageCell = "echoDot"
        bagVCDetailCell1 = "Includes Free Tech Set Up"
        bagVCDetailCell2 = "Includes Free Video Guide"
 
        /*
        bagVCArray = [
            BagModelData(Title: "\(bagVCTitleCell)", Price: "\(bagVCPriceCell)")
        ]
         */
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//---------------------------------------
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return bagVCTableViewStrings.count
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BagCell", for: indexPath) as! BagView
        
        cell.bagViewTitleCell.text = bagVCTitleCell
        cell.bagViewPriceCell.text = bagVCPriceCell
        cell.bagViewImageCell.image = UIImage(named: bagVCImageCell)
        cell.bagViewDetailCell1.text = bagVCDetailCell1
        cell.bagViewDetailCell2.text = bagVCDetailCell2
        
        
        return cell
        }
    
    
    
    
    
    
    
    
    
    
    
//---------------------------------------
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
//---------------------------------------
}
