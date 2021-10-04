//
//  NetworkManager.swift
//  Api Frameworks
//
//  Created by Connor Johnson on 03/10/2021.
//

import Foundation

public class NetworkManager {
    
    func getJoke(_ completion: @escaping (Result<Joke,Error>) -> Void) {
        guard let url = URL(string: "http://api.icndb.com/jokes/random?exclude=[explicit]") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,responce,error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                let joke = try! JSONDecoder().decode(Joke.self, from: data!)
                completion(.success(joke))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
    
    func getCustomNameJoke(FirstName: String, Lastname: String, _ completion: @escaping (Result<Joke,Error>) -> Void) {
        guard let url = URL(string: "http://api.icndb.com/jokes/random?firstName=\(FirstName)&lastName=\(Lastname)") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,responce,error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                let joke = try! JSONDecoder().decode(Joke.self, from: data!)
                completion(.success(joke))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
    
    func getJokeList(_ completion: @escaping (Result<JokeList,Error>) -> Void) {
        guard let url = URL(string: "http://api.icndb.com/jokes/random/15") else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data,responce,error) in
            if let error = error {
                completion(.failure(error.localizedDescription as! Error))
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String: Any]
                let joke = try! JSONDecoder().decode(JokeList.self, from: data!)
                completion(.success(joke))
            } catch let jsonError {
                completion(.failure(jsonError.localizedDescription as! Error))
            }
        }.resume()
    }
    
   
}

