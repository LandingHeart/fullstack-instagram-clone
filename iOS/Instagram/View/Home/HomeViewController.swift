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
    let postManager = PostManager()
    let imageManager = ImageManager()
    var postImages: [UIImage] = []
    
    //View model
    var postCellViewModels: [PostCellViewModel] = []
    
    //component
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        setupTable()
        style()
        layout()
    }
    //MARK: - Setup Table
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostCell.self, forCellReuseIdentifier: PostCell.reuseId)
//        tableView.rowHeight = PostCell.rowHeight
        tableView.separatorStyle = .none
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
        if !postCellViewModels.isEmpty {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostCell.reuseId) as! PostCell
            let vm = postCellViewModels[indexPath.row]
            vm.configure(with: cell)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
}
//MARK: - Networking
extension HomeViewController {
    private func fetchData() {
        let group = DispatchGroup()
        fetchPost(group: group)
        group.notify(queue: .main) {
            self.reloadView()
        }
    }
    private func fetchPost(group: DispatchGroup) {
        group.enter()
        postManager.fetchPost { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let post):
                self.posts = post
            case .failure(let error):
                print(error)
            }
            group.leave() // leave has to be inside of the closure since escaping and it runs async
        }
    }
//    private func fetchImages(group: DispatchGroup) {
//        group.enter()
//
//        DispatchQueue.main.async { [self] in
//            self.postCellViewModels = self.posts.map { post in
//                let imageView = UIImageView()
//                imageView.downloadImage(urlString: post.postImgUrl)
//                return PostCellViewModel(images: imageView)
//
//            }
//        }
//        print(postCellViewModels.count)
//        group.leave()
//    }
    
    private func reloadView() {
        DispatchQueue.main.async {
            self.configuireWithPost()
            self.tableView.reloadData()
        }
    }
    private func configuireWithPost() {
        postCellViewModels = posts.map({ post in
            return PostCellViewModel(imageUrl: post.postImgUrl)
        })
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
