//
//  PostCollectionViewCell.swift
//  A3
//
//  Created by Ambrose Blay on 12/28/24.
//

import Foundation
import UIKit

class PostCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties (view)
    private let imageView = UIImageView()
    private let messageView = UILabel()
    private let likeButtonView = UIButton()
    private let numberOfLikesView = UILabel()
    
    // MARK: - Properties (data)
    private let name: String = "Anonymous"
    private var message: String!
    private var date: String!
    private var numerOfLikes: Int!
    static let reuse: String = "PostCollectionViewCellReuse"
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.a3.white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(post: Post) {
        self.message = post.message
        self.date = post.time.convertToAgo()
        self.numerOfLikes = post.likes.count
    }
    
    // MARK: - Set Up Views
    
}
