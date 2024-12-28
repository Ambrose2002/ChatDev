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
    private let messageLabel = UILabel()
    private let likeButton = UIButton()
    private let numberOfLikesLabel = UILabel()
    private let timeAgoLabel = UILabel()
    private let nameLabel = UILabel()
    
    // MARK: - Properties (data)
    private let name: String = "Anonymous"
    let padding: CGFloat = 24
    static let reuse: String = "PostCollectionViewCellReuse"
    
    
    // MARK: - init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.a3.white
        layer.cornerRadius = 16
        
        setUpImage()
        setUpNameLabel()
        setUpTimeAgoLabel()
        setUpMessageLabel()
        setUpLikeButton()
        setUpNumberOfLikesLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(post: Post) {
        messageLabel.text = post.message
        timeAgoLabel.text = post.time.convertToAgo()
        numberOfLikesLabel.text = "\(post.likes.count) likes"
    }
    
    // MARK: - Set Up Views
    func setUpImage() {
        imageView.image = UIImage(named: "AppDevLogo")
        imageView.layer.cornerRadius = 16
        imageView.layer.masksToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(imageView)
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
    }
    
    func setUpNameLabel() {
        nameLabel.text = self.name
        nameLabel.font = .systemFont(ofSize: 14, weight: .medium)
        nameLabel.textColor = UIColor.a3.black
    }
    
    func setUpTimeAgoLabel() {
        
    }
    
    func setUpMessageLabel() {
        
    }
    
    func setUpLikeButton() {
        
    }
    
    func setUpNumberOfLikesLabel() {
        
    }
    
}
