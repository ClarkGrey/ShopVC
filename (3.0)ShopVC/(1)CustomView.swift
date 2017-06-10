//
//  (1)CustomView.swift
//  (3.0)ShopVC
//
//  Created by E on 5/25/17.
//  Copyright © 2017 E. All rights reserved.
//

import UIKit

private var materialKey = false

extension UIView {
    
    @IBInspectable var Corner8: Bool {
        
        get {
            return materialKey
            }
        set {
            materialKey = newValue
            
            
            if materialKey {
                
                self.layer.masksToBounds = false
                self.layer.cornerRadius = 6
                self.layer.shadowOpacity = 2.0
                self.layer.shadowRadius = 1
                self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
                self.layer.shadowColor = UIColor(red: 157/255, green: 157/255, blue: 157/255, alpha: 1.0).cgColor
            } else {
                self.layer.cornerRadius = 0
                self.layer.shadowOpacity = 0
                self.layer.shadowRadius = 0
                self.layer.shadowColor = nil
                }
            }
    }
    
    
    
    
    
    
}
