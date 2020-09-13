//
//  DispatchGroup.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 3/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import os.log
import UIKit

extension ViewController {
    
    func dispatch() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        
        NetworkManager.shared.APIcaller(using: Constants.uRL) { data, _ in
            defer { dispatchGroup.leave() }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let downloadedFriendsData = try decoder.decode([FriendzData].self, from: data)
                
                self.smViewModel.filteredFriendsData = downloadedFriendsData
                self.smViewModel.friendsData = downloadedFriendsData
            } catch {
                os_log("Error: ", error.localizedDescription)
            }
        }
        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
}
