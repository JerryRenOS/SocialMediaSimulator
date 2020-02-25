//
//  Sachi.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchCriteria = searchController.searchBar.text, searchCriteria.count > 0 {
            filteredFriendsData = friendsData.filter {
                $0.name.contains(searchCriteria) || $0.address.contains(searchCriteria) ||
                    $0.company.contains(searchCriteria)
            }
        } else {
            filteredFriendsData = friendsData
        }
        
        tableView.reloadData()
    }
    
}
      
