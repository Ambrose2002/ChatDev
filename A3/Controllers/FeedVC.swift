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

    // MARK: - Properties (data)
    private var posts: [Post] = [
        Post(id: "0", likes: ["ab2838"], message: "Ola!", time: Date()),
        Post(id: "1", likes: ["ab2838", "cd12"], message: "Hello World", time: Date())
    ]

    // MARK: - viewDidLoad

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "ChatDev"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = UIColor.a3.offWhite

        setupCollectionView()
    }

    // MARK: - Set Up Views

    private func setupCollectionView() {
        collectionView.backgroundColor = UIColor.a3.offWhite

        let padding: CGFloat = 24   // Use this constant when configuring constraints

        // TODO: Set Up CollectionView
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
