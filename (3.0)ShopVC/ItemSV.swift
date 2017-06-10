//
//  ItemSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

//Note: In the future try implementing multi-media for the first product image, most likely it will be a 10 - 15 second clip that           plays in a loop. (Like iOS 11 App Store)

class ItemSV: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {

    @IBOutlet var itemSVTableView: UITableView!
    
    var myIndex = 0
    
    //Item Cell's
    var itemSVTitleCell = [String]()
    
    //Item Top View
    var itemSVTitle = String() //THESE WHERE THE PROBLEM (not supposed to be an array!!!)
    var itemSVPrice = String()
    
    //Item ScrollView Image Array
    @IBOutlet var itemSVScrollView: UIScrollView!
    var itemSVUIImageArray = [UIImageView]()
    var itemSVImageArray = [String]()
    
    @IBOutlet var pageController: UIPageControl!
    
    
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
        
        //Item ScrollView Page Controller
        pageController.numberOfPages = itemSVImageArray.count
            
        return cell
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        }
//---------------------------------------
    
    
    override func viewDidAppear(_ animated: Bool) {
    
        var imageArrayString = itemSVImageArray //This was the problem!!!!!!!!!
        
        for x in 0..<itemSVImageArray.count {
            let imageName = UIImage(named: imageArrayString[x])
            let imageDisplay = UIImageView(image: imageName)
            itemSVUIImageArray.append(imageDisplay)
     
            imageDisplay.contentMode = .scaleAspectFit
            let xPosition = self.itemSVScrollView.frame.width * CGFloat(x) + 15 //Left Space
            imageDisplay.frame = CGRect(x: xPosition, y: 0, width: self.itemSVScrollView.frame.width - 30, //Right Space
                height: self.itemSVScrollView.frame.height)
     
        itemSVScrollView.contentSize.width  = itemSVScrollView.frame.width * CGFloat(x + 1)
        itemSVScrollView.addSubview(imageDisplay)
        }
     
     itemSVScrollView.clipsToBounds = false
     pageController.numberOfPages = itemSVImageArray.count
     }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(page)
        }
    
    
    func titleAndPrice() {
        
        //Forgot wtf i was doing here
        
    }
    
    
//---------------------------------------
}







