//
//  MakeRounded.swift
//  MobileIntershipTask
//
//  Created by Bartosz Pawełczyk on 26/04/2018.
//  Copyright © 2018 Bartosz Pawełczyk. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeRounded(_ radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}
