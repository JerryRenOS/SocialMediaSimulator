//
//  NetworkManager.swift
//  SocialMediaSimulator
//
//  Created by Jerry Ren on 2/25/20.
//  Copyright © 2020 Jerry Ren. All rights reserved.
//

import Foundation
import UIKit

  
class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
           
    func APIcaller(using urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, NetworkError.NotAValidURL)
            return
        }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data, error)
        }.resume()
    }
}
  
enum NetworkError: Error {
    case NotAValidURL
}
        
        
