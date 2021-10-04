//
//  ViewController.swift
//  Co op Tech Test
//
//  Created by Connor Johnson on 03/10/2021.
//

import UIKit
import Api_Frameworks

class ViewController: UIViewController {
    var joke:Joke? = nil
    @IBOutlet weak var JokeLbl: UILabel!
    @IBOutlet weak var GetJokeBtn: UIButton!
    @IBOutlet weak var goToCustom: UIButton!
    @IBOutlet weak var goToList: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI(btn: GetJokeBtn)
        setUI(btn: goToCustom)
        setUI(btn: goToList)
        // Do any additional setup after loading the view.
    }
    
    func setUI(btn: UIButton){
        btn.layer.cornerRadius = 20
        btn.backgroundColor = #colorLiteral(red: 0, green: 0.4549410343, blue: 0.7998990417, alpha: 1)
        btn.setTitleColor(UIColor.white, for: .normal)
    }
    @IBAction func RequestJoke(_ sender: Any) {
        RandomJoke()
    }
    
    func RefreshUi() {
        JokeLbl.text = joke?.value.joke
    }
    
    func RandomJoke() {
        NetworkManager().getJoke { (result) in
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

