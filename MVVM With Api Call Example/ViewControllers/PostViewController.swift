//
//  ViewController.swift
//  MVVM With Api Call Example
//
//  Created by Suprianto Djamalu on 22/06/19.
//  Copyright © 2019 Suprianto Djamalu. All rights reserved.
//

import UIKit

class PostViewController: UIViewController {
    
    @IBOutlet weak var tablePost: UITableView!
    
    let viewModel = PostViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getPosts()
        viewModel.posts.bind(to: tablePost.rx.items(cellIdentifier: "PostViewCell", cellType: PostViewCell.self)){row, post, cell in
            cell.prepare(post)
        }
        
        // try to add data to the posts binding
        // the new data will show up after 9 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 9.0){
            self.viewModel.posts.accept(self.viewModel.posts.value + [Post(id: 999,title: "New Data",body: "")])
        }
        
    }

}

class PostViewCell : UITableViewCell{
    
    @IBOutlet weak var lbTitle: UILabel!
    
    func prepare(_ data: Post){
        lbTitle.text = data.title
    }
    
}

