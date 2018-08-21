//
//  PostCell.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 19/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    var postViewModel: PostViewModel! {
        didSet {
            textLabel?.text = postViewModel.name
            
            
            accessoryType = postViewModel.accessoryType
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
