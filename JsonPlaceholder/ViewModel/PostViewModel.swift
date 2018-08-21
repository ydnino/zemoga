//
//  PostViewModel.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 19/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import Foundation
import UIKit
var top20: Int = 0
struct PostViewModel {
    let name: String
    
    var accessoryType: UITableViewCellAccessoryType
    
    // Dependency Injection (DI)
    init(post: Post) {
        top20 = top20 + 1
        
        self.name = post.title
        if (top20 <= 20){
         accessoryType = .detailDisclosureButton
            print(post.userId)
        } else {
            accessoryType = .disclosureIndicator
        }
        
        
        
    }
}
