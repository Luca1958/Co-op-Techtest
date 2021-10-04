//
//  CustomJokeModel.swift
//  Co op Tech Test
//
//  Created by Connor Johnson on 04/10/2021.
//

//import Foundation
//
//class CustomJokeModel: NSObject {
//    private var networkManager : NetworkManager!
//     weak var view: CustomJokeViewing?
//
//    func CustomJoke(firstname: String, lastname: String) {
//        NetworkManager().getCustomNameJoke(FirstName: firstname, Lastname: lastname) { (result) in
//            switch result {
//            case .success(let joke):
//                DispatchQueue.main.async {
//                    self.view?.RefreshUi(joke)
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    print(error.localizedDescription)
//                }
//            }
//        }
//    }
//}
