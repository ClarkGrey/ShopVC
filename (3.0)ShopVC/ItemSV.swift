//
//  ItemSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class ItemSV: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet var itemSVTableView: UITableView!
    //Eares IBOutlet for ScrollView
    
    var myIndex = 0
    
    //Item Cell's
    var itemSVTitleCell = [String]()
    
    //Item Top View
    var itemSVTitle = String() //THESE WHERE THE PROBLEM (not supposed to be an array!!!)
    var itemSVPrice = String()
    
    //Item ScrollView Image Array
    var itemSVImageArray = [String]()
    
    @IBOutlet var itemSVScrollView: UIScrollView!
    @IBOutlet var pageController: UIPageControl!
    var itemSVUIImageArray = [UIImageView]()
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        itemSVTableView.delegate = self
        itemSVTableView.dataSource = self
        
        itemSVScrollView.delegate = self
        itemSVScrollView.isPagingEnabled = true
        
        
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
    

    //This line has no real affect or value, not like BrowseSV
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        myIndex = indexPath.row
        }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemView
        
        //Item Cell's
        cell.itemViewTitleCell.text = itemSVTitleCell[indexPath.row]
        
        //Item Top View
        cell.itemViewTitle.text = itemSVTitle
        cell.itemViewPrice.text = itemSVPrice
        
        //Item ScrollView Image Array
        
        
        return cell
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        }
//---------------------------------------
    
    override func viewDidAppear(_ animated: Bool) {
        
        //let imagesTest = ["whiteAmazon Echo", "blackAmazonEcho"]
        
        for x in 0..<4 { //Was itemSVUIImageArray.count
            let image = UIImage(named: "blackAmazonEcho") //Was itemSVImageArray
            let imageView = UIImageView(image: image)
            itemSVUIImageArray.append(imageView)
            
            imageView.contentMode = .scaleAspectFit
            let xPosition = self.itemSVScrollView.frame.width * CGFloat(x)
            imageView.frame = CGRect(x: xPosition, y: 0, width: self.itemSVScrollView.frame.width, //x:  , y: Top left corner
                height: self.itemSVScrollView.frame.height)
            
            itemSVScrollView.contentSize.width = itemSVScrollView.frame.width * CGFloat(x + 1)
            itemSVScrollView.addSubview(imageView)
        }
        
        itemSVScrollView.clipsToBounds = false
        pageController.numberOfPages = itemSVImageArray.count //Need to be here! Was the problem
        //Currently only displays one dot because only 1 image
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(page)
        }
    
    
//---------------------------------------
}















