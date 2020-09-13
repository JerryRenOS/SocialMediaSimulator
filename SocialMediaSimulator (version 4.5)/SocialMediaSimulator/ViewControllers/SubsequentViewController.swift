//
//  SubsequentViewController.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 3/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit

class SubsequentViewController: UIViewController {
    @IBOutlet weak var subsequentTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        subsequentTable.dataSource = self
    }
}
