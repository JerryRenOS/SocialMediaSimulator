//
//  ViewController.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
// Protocol Network Layer
import UIKit

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    let smViewModel = SMViewModel()
    
    //  var friendsData = [FriendzData]()
    //  var filteredFriendsData = [FriendzData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "hunting down a friend"
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        // MARK: - DispatchGroup / NetworkManager
        

        let dispatchGroup = DispatchGroup()
 
          dispatchGroup.enter()
            
          NetworkManager.shared.APIcaller(using: "https://www.hackingwithswift.com/samples/friendface.json") { data, _ in
            defer { dispatchGroup.leave() }
            
            guard let data = data else {return}
            
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let downloadedFriendsData = try decoder.decode([FriendzData].self, from: data)
                 print(downloadedFriendsData)
                
                self.smViewModel.filteredFriendsData = downloadedFriendsData
                      self.smViewModel.friendsData = downloadedFriendsData
            } catch {
                print(error.localizedDescription)
            }

          }

        dispatchGroup.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
             
        
        
      //   MARK: - Decoder Stuff
        
//        DispatchQueue.global().async {
//
//            do {
//
//                let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
//                let data = try Data(contentsOf: url) // questionable
//
//                let decoder = JSONDecoder()
//        //        decoder.dateDecodingStrategy = .iso8601
//
//                let downloadedFriendsData = try decoder.decode([FriendzData].self, from: data)
//
//                DispatchQueue.main.async {
//
//                    self.smViewModel.friendsData = downloadedFriendsData
//                    self.smViewModel.filteredFriendsData = downloadedFriendsData
//
//                    //                    self.friendsData = downloadedFriendsData
//                    //                    self.filteredFriendsData = downloadedFriendsData
//
//                    self.tableView.reloadData()
//                }
//
//            } catch {
//                print(error.localizedDescription)
//            }
//        }
        
    }
}


