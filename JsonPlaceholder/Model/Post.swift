//
//  Post.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 19/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import Foundation

struct Post: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

