//
//  TēburuBiewDatasource.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.smViewModel.filteredFriendsData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentity, for: indexPath)
        
        let thisParticularFriend = self.smViewModel.filteredFriendsData[indexPath.row]
  
        cell.textLabel?.text = thisParticularFriend.name
        
        
        print(thisParticularFriend.friends.count)
        
        var friendzCount = thisParticularFriend.friends.count
        var popularityScore = Double(friendzCount) * 0.5
        
        cell.detailTextLabel?.text = "Popularity Score: \(popularityScore) / 10"
        cell.detailTextLabel?.textColor = .systemBlue
        
        return cell
    }
}

//        cell.detailTextLabel?.text = thisParticularFriend.friends.map {
//            $0.name
//        }.joined(separator: ", $")
