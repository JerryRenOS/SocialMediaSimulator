//
//  TēburuBiew.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredFriendsData.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cello", for: indexPath)
        let thisParticularFriend = filteredFriendsData[indexPath.row]
        cell.textLabel?.text = thisParticularFriend.name
        cell.detailTextLabel?.text = thisParticularFriend.friends.map {
            $0.name
        }.joined(separator: ", $")
        
        return cell
        
    }
}
