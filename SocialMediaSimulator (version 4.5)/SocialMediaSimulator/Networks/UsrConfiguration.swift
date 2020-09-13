//
//  UsrConfiguration.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 9/12/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func usrConfigurationFormula(urlString: String) {
        
        let configuration = URLSessionConfiguration.default
        configuration.waitsForConnectivity = true
        
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: urlString) else { return }
        
        let dTask = session.dataTask(with: url) { (data, response, erro) in
            
            guard let httpResponse = response as? HTTPURLResponse else { return }
            guard httpResponse.statusCode == 200 else { return }
            
            guard let data = data else {
                print(erro?.localizedDescription)
                return
            }
            
            if let stringFromData = NSString(data: data, encoding: String.Encoding.utf8.rawValue) as? String {
                print(stringFromData)
            }
        } .resume()
    }
}
