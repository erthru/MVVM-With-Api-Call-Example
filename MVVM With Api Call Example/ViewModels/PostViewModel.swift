//
//  PostViewModel.swift
//  MVVM With Api Call Example
//
//  Created by Suprianto Djamalu on 22/06/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PostViewModel{
    
    var posts = BehaviorRelay<[Post]>(value: [])
    
    func getPosts(){
        
        Api.prepare.fetchPost(completion: {posts, error in
            self.posts.accept(posts)
        })
        
    }
    
}
