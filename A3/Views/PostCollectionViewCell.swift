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
    private let image = UIImageView()
    private let messageLabel = UILabel()
    private let likeButton = UIButton()
    private let numberOfLikesLabel = UILabel()
    private let timeAgoLabel = UILabel()
    
    // MARK: - Properties (data)
    private let name: String = "Anonymous"
    private var message: String!
    private var timeAgo: String!
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
        self.timeAgo = post.time.convertToAgo()
        self.numerOfLikes = post.likes.count
    }
    
    // MARK: - Set Up Views
    
}
