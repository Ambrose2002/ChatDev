//
//  Post.swift
//  A3
//
//  Created by Vin Bui on 10/31/23.
//

import Foundation

struct Post: Codable {
    // TODO: Create a Post Struct here
    let id: String
    var likes: [String]
    let message: String
    let time: Date
}

extension Post {
    
    static let dummy : [Post] = [
        Post(id: "0", likes: ["ab2838"], message: "Ola!", time: Date(timeIntervalSinceNow: (-60 * 15 * 24))),
        Post(id: "1", likes: ["ab2838", "cd12"], message: "Hello World", time: Date(timeIntervalSinceNow: (-60 * 12 * 24))),
        Post(id: "2", likes: ["ab2838", "a", "d"], message: "Welcome to my watery grave", time: Date(timeIntervalSinceNow: -60 * 60 * 24)),
        Post(id: "3", likes: ["ab2838", "a", "c", "e"], message: "Your worst sin is that you have destroyed and betrayed yourself for nothing", time: Date(timeIntervalSinceNow: (-60 * 60 * 23))),
        Post(id: "4", likes: [], message: "The gates of hell are locked from the inside", time: Date(timeIntervalSinceNow: (-60 * 12 * 24))),
        Post(id: "5", likes: ["ab2838", "a", "d", "1", "f"], message: "The pleasures of life lie in the transitions", time: Date(timeIntervalSinceNow: -60 * 60 * 72))
    ]
}
