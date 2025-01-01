//
//  FeedVC.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import UIKit

class FeedVC: UIViewController {

    // MARK: - Properties (view)
    private var collectionView: UICollectionView!
    private var refreshControl = UIRefreshControl()

    // MARK: - Properties (data)
    private var posts: [Post] = []
    static let netId: String = "ab2838"

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ChatDev"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.a3.offWhite
        
        navigationController?.navigationBar.titleTextAttributes = [
                .foregroundColor: UIColor.a3.black // Standard title color
        ]
        navigationController?.navigationBar.largeTitleTextAttributes = [
                .foregroundColor: UIColor.a3.black // Large title color
        ]

        setupCollectionView()
        fetchPosts()
    }
    
    // MARK: -Networking

    @objc private func fetchPosts() {
        NetworkManager.shared.fetchPosts { [weak self] posts in
            guard let self = self else {return}
            
            self.posts = posts
            
            DispatchQueue.main.async{
                self.collectionView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }

    // MARK: - Set Up Views

    private func setupCollectionView() {
        let padding: CGFloat = 24   // Use this constant when configuring constraints
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 16
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.a3.offWhite
        collectionView.register(CreatePostCollectionViewCell.self, forCellWithReuseIdentifier: CreatePostCollectionViewCell.reuse)
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuse)
        collectionView.delegate = self
        collectionView.dataSource = self
        refreshControl.addTarget(self, action: #selector(fetchPosts), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
    }

}

// MARK: - UICollectionViewDelegate

extension FeedVC: UICollectionViewDelegate { }

// MARK: - UICollectionViewDataSource

extension FeedVC: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: Return the cells for each section
        // HINT: Use `indexPath.section` with an if statement
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CreatePostCollectionViewCell.reuse, for: indexPath) as? CreatePostCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            
            return cell
        }
        
        else if indexPath.section == 1 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuse, for: indexPath) as? PostCollectionViewCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(post: posts[indexPath.row])
            return cell
        }

        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: Return the number of rows for each section
        // HINT: Use `section` with an if statement

        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: Return the number of sections in this table view

        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections

        if section == 0 {
                // First section: Top padding and bottom padding (space below the section)
                return UIEdgeInsets(top: 24, left: 24, bottom: 12, right: 24)
        } else {
                // Second section: Top padding (space above the section)
                return UIEdgeInsets(top: 12, left: 24, bottom: 24, right: 24)
        }
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension FeedVC: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: Return the size for each cell per section
        // HINT: Use `indexPath.section` with an if statement
        if indexPath.section == 0 {
            return CGSize(width: collectionView.frame.width, height: 131)
        }
        else {
            return CGSize(width: collectionView.frame.width, height: 184)
        }
    }

}
