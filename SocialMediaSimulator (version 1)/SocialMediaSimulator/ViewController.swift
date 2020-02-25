//
//  ViewController.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    var friendsData = [FriendzData]()
    var filteredFriendsData = [FriendzData]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "hunting down a friend"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
                
        // MARK: - Decoder stuff
            
        DispatchQueue.global().async {
            
            do {
                
                let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                             
                let downloadedFriendsData = try decoder.decode([FriendzData].self, from: data)
                
                DispatchQueue.main.async {
                    self.friendsData = downloadedFriendsData
                    self.filteredFriendsData = downloadedFriendsData
                    self.tableView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)       
            }
            
        }
    }
}

     
