//
//  jokeListViewController.swift
//  Co op Tech Test
//
//  Created by Connor Johnson on 04/10/2021.
//

import UIKit

class jokeListViewController: UITableViewController {
    var jokeList: JokeList?
    private static let cellIdentifier = "cell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ListOfJokes()
    }
    
    
    func ListOfJokes() {
        NetworkManager().getJokeList() { (result) in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self.jokeList = joke
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        jokeList?.value.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        150
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellIdentifier, for: indexPath) as! JokeCell
        let joke = (jokeList?.value[indexPath.row])!

        cell.configure(with: (joke))

        return cell
    }

}


