//
//  ItemSV.swift
//  (3.0)ShopVC
//
//  Created by E on 5/31/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

//Note: In the future try implementing multi-media for the first product image, most likely it will be a 10 - 15 second clip that           plays in a loop. (Like iOS 11 App Store)

class ItemSV: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var itemSVTableView: UITableView!
    
    var myIndex = 0
    
    //Item Cell's
    var itemSVTitleCell = [String]()
    
    //Item Top View
    var itemSVTitle = String() //THESE WHERE THE PROBLEM (not supposed to be an array!!!
    var itemSVPrice = String()
    
    //Item ScrollView Image Array
    @IBOutlet var itemSVScrollView: UIScrollView!
    var itemSVUIImageArray = [UIImageView]()
    var itemSVImageArray = [String]()
    
    //Display
    var itemSVIDNumber = String()
    @IBOutlet var pageController: UIPageControl!
    
    //SubSV (ItemSV TableView Cells)
    var itemSVSubSVItemCells = [[String]]() //Added
   
    
    //Qnty, Type & Background Popups
    @IBOutlet var qntyCenterConstraint: NSLayoutConstraint!
    @IBOutlet var qntyPopupView: UIView!
    
    @IBOutlet var backgroundPopupButton: UIButton!
    @IBOutlet var backgroundPopupCenterConstraint: NSLayoutConstraint!
    
    @IBOutlet var qntyPickerView: UIPickerView!
    @IBOutlet var qntyTextField: UITextField!
    var itemSVQntyNumbers = [Int]()
    
    @IBOutlet var typePickerView: UIPickerView!
    @IBOutlet var typeTextField: UITextField!
    @IBOutlet var selectLabel: UILabel!
    var itemSVType = [String]()
    
    //Add to Bag Popup
    @IBOutlet var addToBagPopupView: UIView!
    @IBOutlet var addToBagCenterConstraint: NSLayoutConstraint!
    
    
    
    
//---------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()

        itemSVTableView.delegate = self
        itemSVTableView.dataSource = self
        
        itemSVScrollView.delegate = self
        itemSVScrollView.isPagingEnabled = true
        
        qntyPopupView.layer.cornerRadius = 12
        qntyPopupView.layer.masksToBounds = true
        
        qntyPickerView.delegate = self
        qntyPickerView.dataSource = self
        
        typePickerView.delegate = self
        typePickerView.dataSource = self
        
        //Default Type Text
        typeTextField.text = itemSVType[0]
        
       
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        }
//----------------- TableView & Segue ----------------------
    
    
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
        cell.itemViewTitle.text = itemSVTitle //Currently Hidden
        cell.itemViewPrice.text = itemSVPrice
        
        //Item ScrollView Page Controller
        pageController.numberOfPages = itemSVImageArray.count
        
        //Display
        cell.itemViewIDNumber.text = itemSVIDNumber //Currently Hidden
            
        return cell
        }
    
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let indexPath : NSIndexPath = self.itemSVTableView.indexPathForSelectedRow! as NSIndexPath
        let destination = segue.destination as! SubSV
        
            destination.subSVItemCells = itemSVSubSVItemCells[indexPath.row]
        
        
        }
//------------------ ScrollView Images & Page Controller ---------------------
    
    override func viewDidAppear(_ animated: Bool) {
    
        var imageArrayString = itemSVImageArray //This was the problem!!!!!!!!!
        
        for x in 0..<itemSVImageArray.count {
            let imageName = UIImage(named: imageArrayString[x])
            let imageDisplay = UIImageView(image: imageName)
            imageDisplay.clipsToBounds = true
            itemSVUIImageArray.append(imageDisplay)
            
     
            imageDisplay.contentMode = .scaleAspectFill
            let xPosition = self.itemSVScrollView.frame.width * CGFloat(x) //Left
            imageDisplay.frame = CGRect(x: xPosition, y: 0, width: self.itemSVScrollView.frame.width, //Right (double opp of left)
                height: self.itemSVScrollView.frame.height) //Bottom
                //Height needs to be the same as the scrollview top constraint in main.storyboard
        
        itemSVScrollView.contentSize.width  = itemSVScrollView.frame.width * CGFloat(x + 1)
        itemSVScrollView.addSubview(imageDisplay)
        }
     
    //Page Controller Number
    itemSVScrollView.clipsToBounds = true
    pageController.numberOfPages = itemSVImageArray.count
    }
    
    
    
    //Page Controller Movement
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = scrollView.contentOffset.x / scrollView.frame.size.width
        pageController.currentPage = Int(page)
        }
    
//----------------- Popups ----------------------
    
    //Qnty & Types
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 1 {
            return itemSVQntyNumbers.count
        } else {
            return itemSVType.count
            }
        }

    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 1 {
            return "\(itemSVQntyNumbers[row])"
        } else {
            return "\(itemSVType[row])"
            }
        
        }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 1 {
            qntyTextField.text = "\(itemSVQntyNumbers[row])"
        } else {
            typeTextField.text = itemSVType[row]
            }
        
        }
    
    
    //Qnty Pressed
    @IBAction func qntyPopupPresses(_ sender: Any) {
        
        qntyCenterConstraint.constant = 0
        backgroundPopupCenterConstraint.constant = 0
        qntyPopupView.isHidden = false
        qntyPickerView.isHidden = false
        typePickerView.isHidden = true
        backgroundPopupButton.isHidden = false
        selectLabel.text = "Select Quantity:"
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0,
                       options: .curveEaseOut, animations: { self.view.layoutIfNeeded() } , completion: nil)
        UIView.animate(withDuration: 0.9, animations: {
            self.backgroundPopupButton.alpha = 0.5 } )
        }
    
    //Type Pressed
    @IBAction func typePopupPressed(_ sender: Any) {
        
        qntyCenterConstraint.constant = 0
        backgroundPopupCenterConstraint.constant = 0
        qntyPopupView.isHidden = false
        qntyPickerView.isHidden = true
        typePickerView.isHidden = false
        backgroundPopupButton.isHidden = false
        selectLabel.text = "Select Type:"
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0,
                       options: .curveEaseOut, animations: { self.view.layoutIfNeeded() } , completion: nil)
        UIView.animate(withDuration: 0.9, animations: {
            self.backgroundPopupButton.alpha = 0.5 } )
        }
    
    //Close Qnty
    @IBAction func qntyPopupClose(_ sender: Any) {
        
        qntyCenterConstraint.constant = -400
        backgroundPopupCenterConstraint.constant = 450
        qntyPopupView.isHidden = true
        qntyPickerView.isHidden = true
        typePickerView.isHidden = true
        backgroundPopupButton.isHidden = true
        UIView.animate(withDuration: 0.0, animations: {
            self.view.layoutIfNeeded()
            self.backgroundPopupButton.alpha = 0.0 } )
        }
    
  //Closes all popup views and moves its constant by pressing Background
    @IBAction func backgroundPopupClose(_ sender: Any) {
        
        qntyCenterConstraint.constant = -400
        backgroundPopupCenterConstraint.constant = 450
        addToBagCenterConstraint.constant = -500
        qntyPopupView.isHidden = true
        backgroundPopupButton.isHidden = true
        addToBagPopupView.isHidden = true
        UIView.animate(withDuration: 0.0, animations: {
            self.view.layoutIfNeeded()
            self.backgroundPopupButton.alpha = 0.0 } )
        }
    
    
    //Add to Bag Popup Pressed
    @IBAction func addToBagPressed(_ sender: UIButton) {
        
        addToBagCenterConstraint.constant = 0
        backgroundPopupCenterConstraint.constant = 0
        addToBagPopupView.isHidden = false
        backgroundPopupButton.isHidden = false
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0,
                       options: .curveEaseOut, animations: { self.view.layoutIfNeeded() } , completion: nil)
        UIView.animate(withDuration: 0.9, animations: {
            self.backgroundPopupButton.alpha = 0.5 } )
        
        //---------------------
        
        
        
        
        
            //This is where the add to bag cell info is suppose to go, i think.
       
        
        
        
        
    }
    
    //Closes Bag Popup and moves it
    @IBAction func addToBagClose(_ sender: Any) {
        
        addToBagCenterConstraint.constant = -500
        backgroundPopupCenterConstraint.constant = 450
        addToBagPopupView.isHidden = true
        backgroundPopupButton.isHidden = true
        UIView.animate(withDuration: 0.0, animations: {
            self.view.layoutIfNeeded()
            self.backgroundPopupButton.alpha = 0.0 } )
        
        }
 
//---------------------------------------
}







