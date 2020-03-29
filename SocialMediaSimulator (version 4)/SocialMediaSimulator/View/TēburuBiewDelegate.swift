//
//  TēburuBiewDelegate.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 3/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation

extension ViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let subsequentVC = storyboard?.instantiateViewController(withIdentifier: "Subsequent") //as! SubsequentViewController
        
        navigationController?.pushViewController(subsequentVC!, animated: true)
    }
}
