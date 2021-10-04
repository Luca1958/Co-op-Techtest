//
//  Jokes.swift
//  Api Frameworks
//
//  Created by Connor Johnson on 03/10/2021.
//

import Foundation

struct Joke: Codable {
    let type: String
    let value: Value
}

// MARK: - Value
struct Value: Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
