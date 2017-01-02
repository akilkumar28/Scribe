//
//  RoundedButton.swift
//  Scribe
//
//  Created by AKIL KUMAR THOTA on 1/2/17.
//  Copyright © 2017 AKIL KUMAR THOTA. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {

    @IBInspectable var CornerRadius : CGFloat = 30.0 {
        didSet{
            self.layer.cornerRadius = CornerRadius
        }
        
        
        }
    override func prepareForInterfaceBuilder() {
        self.layer.cornerRadius = CornerRadius
    }
    }
    
    


