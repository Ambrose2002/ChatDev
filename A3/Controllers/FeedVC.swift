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

        return 0 // Replace this line
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        // TODO: Return the inset for the spacing between the two sections

        return UIEdgeInsets() // Replace this line
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
