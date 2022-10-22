//
//  HomeViewController.swift
//  Instagram
//
//  Created by Huang Yan on 10/15/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //Request Model
    var posts: [Post] = []
    
    //component
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
        style()
        layout()
    }
    //MARK: - Setup Table
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseId)
        tableView.rowHeight = PostCell.rowHeight
    }
}

//MARK: - TableView Delegate Method
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
//MARK: - TableView Data Source Method
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId) as! PostCell
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}

//MARK: - style
extension HomeViewController {
    private func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blue
    }
}

//MARK: - layout
extension HomeViewController {
    private func layout() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            //tableView
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
