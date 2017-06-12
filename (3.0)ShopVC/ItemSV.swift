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
    var itemSVTitle = String() //THESE WHERE THE PROBLEM (not supposed to be an array!!!)
    var itemSVPrice = String()
    
    //Item ScrollView Image Array
    @IBOutlet var itemSVScrollView: UIScrollView!
    var itemSVUIImageArray = [UIImageView]()
    var itemSVImageArray = [String]()
    
    //Display
    var itemSVIDNumber = String()
    
    @IBOutlet var pageController: UIPageControl!
    
    //Popups
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
        typeTextField.text = itemSVType[0]
       
        
        
        itemSVTitleCell = ["Tech Specs", "Frequently Asked Questions", "What's Included",
                           "Warranty & Installation"]
        
      
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        }
//---------------------------------------
    //TableView 
    
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
        
        //Display
        cell.itemViewIDNumber.text = itemSVIDNumber
            
        return cell
        }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        }
//---------------------------------------
    //ScrollView Images
    
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
    //Popups (Qnty)
    
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
    
  
    @IBAction func backgroundPopupClose(_ sender: Any) {
        
        qntyCenterConstraint.constant = -400
        backgroundPopupCenterConstraint.constant = 450
        qntyPopupView.isHidden = true
        backgroundPopupButton.isHidden = true
        UIView.animate(withDuration: 0.0, animations: {
            self.view.layoutIfNeeded()
            self.backgroundPopupButton.alpha = 0.0 } )
        }
    
    
    
//---------------------------------------
}







