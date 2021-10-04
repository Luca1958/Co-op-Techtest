//
//  CustomJokeViewController.swift
//  Co op Tech Test
//
//  Created by Connor Johnson on 04/10/2021.
//

import UIKit

class CustomJokeViewController: UIViewController {
    var joke:Joke? = nil
    var firstname:String?
    var lastname:String?
    @IBOutlet weak var JokeLbl: UILabel!
    @IBOutlet weak var Txtbar: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBtn.layer.cornerRadius = 20
        searchBtn.backgroundColor = #colorLiteral(red: 0, green: 0.4549410343, blue: 0.7998990417, alpha: 1)
        searchBtn.setTitleColor(UIColor.white, for: .normal)
    }
    
    @IBAction func BtnPress(_ sender: Any) {
        if Txtbar.text != nil && Txtbar.text != " "{
            var names = Txtbar.text?.components(separatedBy: " ")
            if names?.count == 2 {
                if names?[0] != nil && names?[1] != nil && names?[0] != "" && names?[1] != "" {
                    firstname = names?[0]
                    lastname = names?[1]
                    CustomJoke()
                }else{
                    let alert = UIAlertController(title: "Error", message: "Please input First and Last name, thank you", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

                    self.present(alert, animated: true)
                }
            }
        }
    }
    
    func RefreshUi() {
        JokeLbl.text = joke?.value.joke
    }
    
    func CustomJoke() {
        NetworkManager().getCustomNameJoke(FirstName: firstname!, Lastname: lastname!) { (result) in
            switch result {
            case .success(let joke):
                DispatchQueue.main.async {
                    self.joke = joke
                    self.RefreshUi()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
}
