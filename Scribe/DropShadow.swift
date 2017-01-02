//
//  DropShadow.swift
//  Scribe
//
//  Created by AKIL KUMAR THOTA on 1/2/17.
//  Copyright © 2017 AKIL KUMAR THOTA. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func shadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.7
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize.zero
        
    }
    }
