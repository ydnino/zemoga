//
//  InformationCotroller.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 20/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import Foundation
import UIKit

class InformationController: UITableViewController {
    var selectedIdPost:String? 
    var postViewModels = [PostViewModel]()
    let cellId = "cellId"
    @objc func handleShowIndexPath(){
        setupTableView()
        fetchData()
        var indexPathToReload = [IndexPath]()
        for index in postViewModels.indices {
            let indexPath = IndexPath(row: index, section: 0)
            indexPathToReload.append(indexPath)
        }
        tableView.reloadRows(at: indexPathToReload, with: .right)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedIdPost)
        reload()
        setupNavBar()
        setupTableView()
        fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      
    }
    fileprivate func fetchData() {
        Service.shared.fetchPost { (post, err) in
            if let err = err {
                print("Failed to fetch posts:", err)
                return
            }
            
            self.postViewModels = post?.map({return PostViewModel(post: $0)}) ?? []
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! PostCell
        let postViewModel = postViewModels[indexPath.row]
        cell.postViewModel = postViewModel
        return cell
    }

    
    fileprivate func setupTableView() {
        tableView.register(PostCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 24, bottom: 0, right: 24)
        tableView.separatorColor = .mainTextBlue
        tableView.backgroundColor = UIColor.rgb(r: 12, g: 47, b: 57)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
        tableView.tableFooterView = UIView()
    }
    
    fileprivate func setupNavBar() {
        navigationItem.title = "Information"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 185, b: 0)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    fileprivate func reload (){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Favorite", style: .plain, target: self, action: #selector(handleShowIndexPath))
    }
}
