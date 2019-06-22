//
//  Post.swift
//  MVVM With Api Call Example
//
//  Created by Suprianto Djamalu on 22/06/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation

struct Post : Decodable{
    let id: Int
    let title: String
    let body: String
    
    private enum CodingKeys: String, CodingKey{
        case id
        case title
        case body
    }
}
