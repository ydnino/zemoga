//
//  Services.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 19/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import Foundation

class Service: NSObject {
    static let shared = Service()
    
    func fetchPost(completion: @escaping ([Post]?, Error?) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            if let err = err {
                completion(nil, err)
                print("Failed to fetch post:", err)
                return
            }
            
            // check response
            
            guard let data = data else { return }
            do {
                
                let post = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    completion(post, nil)
                }
            } catch let jsonErr {
                print("Failed to decode:", jsonErr)
            }
            }.resume()
    }
}
