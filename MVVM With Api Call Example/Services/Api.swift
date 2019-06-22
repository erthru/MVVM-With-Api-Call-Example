//
//  Api.swift
//  MVVM With Api Call Example
//
//  Created by Suprianto Djamalu on 22/06/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import Foundation
class Api{
    
    static let prepare = Api()
    
    func fetchPost(completion: @escaping ([Post], Bool) -> ()){
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            do{
                let posts = try JSONDecoder().decode([Post].self, from: data!)
                DispatchQueue.main.async {
                    completion(posts, false)
                }
            }catch let err{
                completion([], true)
                print(err)
            }
        }.resume()
    }
    
}
