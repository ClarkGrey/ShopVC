//
//  SubSV.swift
//  (3.0)ShopVC
//
//  Created by E on 6/16/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

class SubSV: UIViewController, UIScrollViewDelegate {
    
    //SecondItem ScrollView Image Array
    @IBOutlet var subSVScrollView: UIScrollView!
    
    
    //SubSV (ItemSV TableView Cells)
    var subSVItemCells = [String]()
    var subSVUIImageArray = [UIImageView]()
    
    
    //Display
    @IBOutlet var pageController: UIPageControl!
    
    
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        
        subSVScrollView.delegate = self
        subSVScrollView.isPagingEnabled = true
        
       
        
     
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        }
//---------------------------------------
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        var imageArrayString = subSVItemCells
        
        for x in 0..<subSVItemCells.count {
            let imageName = UIImage(named: imageArrayString[x])
            let imageDisplay = UIImageView(image: imageName)
            imageDisplay.clipsToBounds = true
            subSVUIImageArray.append(imageDisplay)
            
            
            imageDisplay.contentMode = .scaleAspectFill
            let xPosition = self.subSVScrollView.frame.width * CGFloat(x) //Left
            imageDisplay.frame = CGRect(x: xPosition, y: 0, width: self.subSVScrollView.frame.width, //Right (double opp of left)
                height: self.subSVScrollView.frame.height - 60) //Bottom
            //Height needs to be the same as the scrollview top constraint in main.storyboard
            
            subSVScrollView.contentSize.width  = subSVScrollView.frame.width * CGFloat(x + 1)
            subSVScrollView.addSubview(imageDisplay)
            }
        
        //Page Controller Number
        subSVScrollView.clipsToBounds = true
        pageController.numberOfPages = subSVItemCells.count
        
        }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(page)
        }
    
    
//---------------------------------------
}























