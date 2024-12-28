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
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding)
        ])
    }
    
    func setUpTimeAgoLabel() {
        timeAgoLabel.font = .systemFont(ofSize: 12, weight: .medium)
        timeAgoLabel.textColor = UIColor.a3.silver
        timeAgoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(timeAgoLabel)
        
        NSLayoutConstraint.activate([
            timeAgoLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            timeAgoLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 17.5)
        ])
    }
    
    func setUpMessageLabel() {
        messageLabel.font = .systemFont(ofSize: 14)
        messageLabel.textColor = UIColor.a3.black
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 3
        
        contentView.addSubview(messageLabel)
        
        NSLayoutConstraint.activate([
            messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            messageLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            messageLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
        ])
    }
    
    func setUpLikeButton() {
        
        let heartImage = UIImage(systemName: "heart")
        likeButton.setImage(heartImage, for: .normal)
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(likeButton)
        
        NSLayoutConstraint.activate([
            likeButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 80),
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
        
    }
    
    func setUpNumberOfLikesLabel() {
        numberOfLikesLabel.font = .systemFont(ofSize: 12, weight: .medium)
        numberOfLikesLabel.textColor = UIColor.a3.black
        numberOfLikesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(numberOfLikesLabel)
        
        NSLayoutConstraint.activate([
            numberOfLikesLabel.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 4),
            numberOfLikesLabel.topAnchor.constraint(equalTo: likeButton.topAnchor, constant: 5)
        ])
    }
    
}
