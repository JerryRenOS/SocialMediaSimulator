//
//  ViewController.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/24/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//
// Protocol Network Layer
import UIKit
import os.log

class ViewController: UITableViewController, UISearchResultsUpdating {
    
    let smViewModel = SMViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dispatch()
        
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = Constants.searchBarPlaceholder
        search.searchResultsUpdater = self
        navigationItem.searchController = search
        
        print(popArray)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
     //   tableAnimated()
    }
}

public var popArray: [Int] = []
