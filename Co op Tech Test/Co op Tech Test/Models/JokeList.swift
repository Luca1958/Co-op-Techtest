//
//  JokeList.swift
//  Co op Tech Test
//
//  Created by Connor Johnson on 04/10/2021.
//
import Foundation

// MARK: - Welcome
struct JokeList: Codable {
    let type: String
    var value: [jokeValue]
}

// MARK: - Value
struct jokeValue: Codable {
    let id: Int
    let joke: String
    let categories: [String]
}
