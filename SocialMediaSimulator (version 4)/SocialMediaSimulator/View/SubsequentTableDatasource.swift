//
//  SubsequentTableDatasource.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 3/26/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import UIKit
import Foundation
   
extension SubsequentViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = subsequentTable.dequeueReusableCell(withIdentifier: Constants.subsequentCellIdentity, for: indexPath)
        
        cell.textLabel?.text = "var Amygdala"
        
        return cell
    }
}
