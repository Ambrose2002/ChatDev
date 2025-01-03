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
    private let topSortLabel = UILabel()
    private let newSortLabel = UILabel()

    // MARK: - Properties (data)
    private var posts: [Post] = []
    static let netId: String = "ab2838"
    private var isTopSelected = true

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
        setupTopSortLabel()
        setupNewSortLabel()
        setupCollectionView()
        fetchPosts()
        
        setupNavigationBarTitleView()
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
    
    private func setupTopSortLabel() {
        topSortLabel.text = "Top"
        let topSortTapGesture = UITapGestureRecognizer(target: self, action: #selector(topSortLabelTapped))
        topSortLabel.isUserInteractionEnabled = true
        topSortLabel.textColor = .a3.black
        topSortLabel.addGestureRecognizer(topSortTapGesture)
        
        view.addSubview(topSortLabel)
        
        topSortLabel.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    private func setupNewSortLabel() {
        newSortLabel.text = "New"
        let newSortTapGesture = UITapGestureRecognizer(target: self, action: #selector(newSortLabelTapped))
        newSortLabel.isUserInteractionEnabled = true
        newSortLabel.textColor = .a3.black
        newSortLabel.addGestureRecognizer(newSortTapGesture)
        
    }
    
    private func setupNavigationBarTitleView() {

        
        let stackView = UIStackView(arrangedSubviews: [topSortLabel, newSortLabel])
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.alignment = .center
        
        navigationItem.titleView = stackView
    }

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
    
    @objc private func topSortLabelTapped() {
        isTopSelected = true
        updateTabAppearance()
        sortPosts(by: .top)
    }
    
    @objc private func newSortLabelTapped() {
        isTopSelected = false
        updateTabAppearance()
        sortPosts(by: .new)
    }
    
    private func updateTabAppearance() {
        if isTopSelected {
            topSortLabel.textColor = .a3.ruby
            newSortLabel.textColor = .a3.silver
        } else {
            topSortLabel.textColor = .a3.silver
            newSortLabel.textColor = .a3.ruby
        }
    }
    
    private func sortPosts(by sortType: SortType) {
        switch sortType {
        case .top:
            posts.sort {
                $0.likes.count > $1.likes.count
            }
        case .new:
            posts.sort {
                $0.time > $1.time
            }
        }
        collectionView.reloadData()
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

// MARK: - enum
enum SortType {
    case top
    case new
}
