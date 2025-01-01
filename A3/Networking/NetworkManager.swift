//
//  NetworkManager.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import Alamofire
import Foundation

class NetworkManager {

    /// Shared singleton instance
    static let shared = NetworkManager()

    private init() { }

    /// Endpoint for dev server
    private let devEndpoint: String = "https://chatdev-wuzwgwv35a-ue.a.run.app/api/posts/"
    private let decoder: JSONDecoder = JSONDecoder()

    // MARK: - Requests
    func fetchPosts(completion: @escaping ([Post]) -> Void) {
        
        /// Set date decoding strategy
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(devEndpoint, method: .get)
            .validate()
            .responseDecodable(of: [Post].self, decoder: decoder) { response in
                
                switch response.result {
                case .success(let posts):
                    print("Successfully fetched \(posts.count) posts")
                    completion(posts)
                
                case .failure(let error):
                    print("Error in NetworkManager.fetchPosts: \(error)")
                }
            }
    }
    
    func createPosts(message: String, completion: @escaping (Bool) -> Void) {
        
        let parameters: Parameters = [
            "message": message
        ]
        
        let postEndpoint = "\(devEndpoint)create"
        
        AF.request(postEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: Post.self, decoder: decoder) { response in
                
                switch response.result {
                case .success(let post):
                    print("Successfully added \(post.message) to posts")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.createPosts: \(error)")
                    completion(false)
                }
            }
    }
    
    func likePost(postId: String, netId: String, completion: @escaping (Bool) -> Void) {
        
        let parameters: Parameters = [
            "post_id": postId,
            "net_id": netId
        ]
        
        let likeEndpoint = "\(devEndpoint)like"
        
        AF.request(likeEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable (of: Post.self, decoder: decoder){ response in
                
                switch response.result {
                case .success(let post):
                    print("\(netId) successfully liked post with id \(post.id)")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.likePost: \(error)")
                    completion(false)
                }
            }
    }
    
    func unlikePost(postId: String, netId: String, completion: @escaping (Bool) -> Void) {
        let parameters: Parameters = [
            "post_id": postId,
            "net_id": netId
        ]
        
        let likeEndpoint = "\(devEndpoint)unlike"
        
        AF.request(likeEndpoint, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable (of: Post.self, decoder: decoder){ response in
                
                switch response.result {
                case .success(let post):
                    print("\(netId) successfully unliked post with id \(post.id)")
                    completion(true)
                case .failure(let error):
                    print("Error in NetworkManager.likePost: \(error)")
                    completion(false)
                }
            }
    }

}
