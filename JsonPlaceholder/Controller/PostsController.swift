//
//  PostsController.swift
//  JsonPlaceholder
//
//  Created by Rhonal Delgado on 19/08/18.
//  Copyright © 2018 Yeison David Nino. All rights reserved.
//

import UIKit

class PostController: UITableViewController {
    
    var postViewModels = [PostViewModel]()
    var idPostViemModels = [IdPostViewModel]()
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
        reload()
        setupNavBar()
        setupTableView()
        fetchData()
    }
    
    fileprivate func fetchData() {
        Service.shared.fetchPost { (post, err) in
            if let err = err {
                print("Failed to fetch posts:", err)
                return
            }
            
            self.postViewModels = post?.map({return PostViewModel(post: $0)}) ?? []
            self.idPostViemModels = post?.map({return IdPostViewModel(post: $0)}) ?? []
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
    override func tableView(_ tableView: UITableView, viewForHeaderInSection
        section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("ALL", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        return button
    }

    override func tableView(_ tableView: UITableView, viewForFooterInSection
        section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("Delete All", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        
        button.addTarget(self, action: #selector(eraseAll), for: .touchUpInside)
        return button
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle:
        UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        if (editingStyle == .delete){
            postViewModels.remove(at: indexPath.item)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
    @objc func eraseAll() {
        var indexPaths = [IndexPath]()
        for row in postViewModels.indices{
            let indexPath = IndexPath(row: row, section: 0)
            indexPaths.append(indexPath)
        }
        postViewModels.removeAll()
        tableView.deleteRows(at: indexPaths, with: .fade)
    }
    override func tableView(_ tableView: UITableView,
            heightForHeaderInSection section: Int) -> CGFloat{
        return 34
    }
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        print(idPostViemModels[indexPath.row])
        navigationController?.pushViewController(InformationController(), animated: true)
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
        navigationItem.title = "Posts"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = .yellow
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = UIColor.rgb(r: 50, g: 185, b: 0)
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    fileprivate func reload (){
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Reload", style: .plain, target: self, action: #selector(handleShowIndexPath))
   }
}

class CustomNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

extension UIColor {
    static let mainTextBlue = UIColor.rgb(r: 7, g: 71, b: 89)
    static let highlightColor = UIColor.rgb(r: 50, g: 199, b: 242)
    
    static func rgb(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
