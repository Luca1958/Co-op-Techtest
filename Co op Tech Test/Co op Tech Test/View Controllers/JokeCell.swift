//
//  JokeCell.swift
//  Co op Tech Test
//
//  Created by Connor Johnson on 04/10/2021.
//

import Foundation
import UIKit

final class JokeCell: UITableViewCell {
    
    @IBOutlet weak var JokeLbl: UILabel!
    
    func configure(with joke: jokeValue) {
        JokeLbl.text = joke.joke
    }
}
