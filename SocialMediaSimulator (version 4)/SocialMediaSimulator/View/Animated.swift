//
//  Animated.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 3/23/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

extension ViewController {
    
    func tableAnimated() {
        
        tableView.reloadData()
        
        let visibles = tableView.visibleCells
        print(visibles)
        let currentTableHeight = tableView.bounds.size.height
        print(currentTableHeight)
           
        for individualCell in visibles {
            individualCell.transform = CGAffineTransform(translationX: 0, y: currentTableHeight)
        }
        
        var delayCounter = 0
        
        for cell in visibles {
            
            UIView.animate(withDuration: 1.73, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.7, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            
            delayCounter += 1
            
        }
    }
}
