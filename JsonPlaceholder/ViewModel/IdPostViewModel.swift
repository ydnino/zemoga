//
//  IdPostViewModel.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 20/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import Foundation
import UIKit
struct IdPostViewModel {
    let name: Int
    
    var accessoryType: UITableViewCellAccessoryType
    
    // Dependency Injection (DI)
    init(post: Post) {
        top20 = top20 + 1
        
        self.name = post.id
        if (top20 <= 20){
            accessoryType = .detailDisclosureButton
            print(post.userId)
        } else {
            accessoryType = .disclosureIndicator
        }
        
        
        
    }
}

