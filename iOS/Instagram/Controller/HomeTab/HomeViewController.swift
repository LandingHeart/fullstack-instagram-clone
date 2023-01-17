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
    var isImageLoaded = false
    
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
        setNavBar()
    }
    
    //MARK: - Setup Table
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostImageCell.self, forCellReuseIdentifier: PostImageCell.cellIdentifier)
        tableView.register(PostHeaderCell.self, forCellReuseIdentifier: PostHeaderCell.cellIdentifier)
        tableView.register(PostActionCell.self, forCellReuseIdentifier: PostActionCell.cellIdentifier)
        tableView.register(PostCommentCell.self, forCellReuseIdentifier: PostCommentCell.cellIdentifier)
        tableView.estimatedRowHeight = 400
        tableView.rowHeight = UITableView.automaticDimension
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
    func numberOfSections(in tableView: UITableView) -> Int {
        return postCellViewModels.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if !postCellViewModels.isEmpty { // we have the posts
            let rowAt = indexPath.row
            let vm = postCellViewModels[indexPath.section]
            switch rowAt {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: PostHeaderCell.cellIdentifier, for: indexPath) as! PostHeaderCell
                return cell
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: PostImageCell.cellIdentifier, for: indexPath) as! PostImageCell
                if let image = vm.postImage {
                    cell.loadedImages = image
                } else {
                    let token = ImageSource.shared.fetchImage(urlString: vm.imageUrl) { [weak self] image in
                        guard let strongSelf = self, let image = image else { return }
                        strongSelf.postCellViewModels[indexPath.section].postImage = image
                        DispatchQueue.main.async {
                            tableView.reloadRows(at: [indexPath], with: .automatic)
                        }
                    }
                    cell.onReuse = {
                        if let token = token {
                            ImageSource.shared.cancelLoad(token)
                        }
                    }
                }
                return cell
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: PostActionCell.cellIdentifier, for: indexPath) as! PostActionCell
                return cell
            case 3:
                let cell = tableView.dequeueReusableCell(withIdentifier: PostCommentCell.cellIdentifier, for: indexPath) as! PostCommentCell
                cell.comment.text = vm.description
                return cell
            default:
                fatalError("Unexpected switch by cellForRowAt")
            }
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 70
        case 1:
            return 300
        case 2:
            return 88
        case 3:
            return 60
        default:
            fatalError("Unexpected switch by estimatedHeightForRowAt")
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowAt = indexPath.row
        switch rowAt {
        case 0:
            return 70
        case 1:
            if let image = postCellViewModels[indexPath.section].postImage {
                let imageWidth = image.size.width
                let imageHeight = image.size.height
                guard imageWidth > 0 && imageHeight > 0 else { return UITableView.automaticDimension }
                
                //images always be the full width of the screen
                let requiredWidth = tableView.frame.width
                
                let widthRatio = requiredWidth / imageWidth
                
                let requiredHeight = imageHeight * widthRatio
                
                return requiredHeight
            } else {
                return UITableView.automaticDimension
            }
        case 2:
            return 88
        case 3:
            return UITableView.automaticDimension
        default:
            return UITableView.automaticDimension
        }
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
        postCellViewModels = posts.map({
            return PostCellViewModel(imageUrl: $0.postImgUrl, description: $0.description)
        })
    }
}

//MARK: - style
extension HomeViewController {
    private func style() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
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
