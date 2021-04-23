//
//  ViewController.swift
//  lifeCounter
//
//  Created by stlp on 4/22/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var life1: UILabel!
    @IBOutlet weak var life2: UILabel!
    @IBOutlet weak var life3: UILabel!
    @IBOutlet weak var life4: UILabel!
    @IBOutlet weak var loser: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    func changeValue(value: Int, target: Int) {
        switch target {
        case 1:
            let lifeTotal = Int(self.life1.text!)!
            let newValue = lifeTotal + value
            self.life1.text = String(newValue)
            if newValue <= 0 {
                self.loser.text = "Player 1"
            }
        case 2:
            let lifeTotal = Int(self.life2.text!)!
            let newValue = lifeTotal + value
            self.life2.text = String(newValue)
            if newValue <= 0 {
                self.loser.text = "Player 2"
            }
        case 3:
            let lifeTotal = Int(self.life3.text!)!
            let newValue = lifeTotal + value
            self.life3.text = String(newValue)
            if newValue <= 0 {
                self.loser.text = "Player 3"
            }
        case 4:
            let lifeTotal = Int(self.life4.text!)!
            let newValue = lifeTotal + value
            self.life4.text = String(newValue)
            if newValue <= 0 {
                self.loser.text = "Player 4"
            }
        default:
            print("must be range 1-4")
        
        }
        
    }
    @IBAction func negFivePlayerOne(_ sender: Any) {
        changeValue(value: -5, target: 1)
    }
    
    @IBAction func negOnePlayerOne(_ sender: Any) {
        changeValue(value: -1, target: 1)
    }
    @IBAction func posOnePlayerOne(_ sender: Any) {
        changeValue(value: 1, target: 1)
    }
    @IBAction func posFivePlayerOne(_ sender: Any) {
        changeValue(value: 5, target: 1)
    }
    @IBAction func negFivePlayerTwo(_ sender: Any) {
        changeValue(value: -5, target: 2)
    }
    @IBAction func negOnePlayerTwo(_ sender: Any) {
        changeValue(value: -1, target: 2)

    }
    @IBAction func posOnePlayerTwo(_ sender: Any) {
        changeValue(value: 1, target: 2)

    }
    @IBAction func posFivePlayerTwo(_ sender: Any) {
        changeValue(value: 5, target: 2)

    }
    @IBAction func negFivePlayerThree(_ sender: Any) {
        changeValue(value: -5, target: 3)

    }
    @IBAction func negOnePlayerThree(_ sender: Any) {
        changeValue(value: -1, target: 3)

    }
    @IBAction func posOnePlayerThree(_ sender: Any) {
        changeValue(value: 1, target: 3)

    }
    @IBAction func posFivePlayerThree(_ sender: Any) {
        changeValue(value: 5, target: 3)

    }
    @IBAction func negFivePlayerFour(_ sender: Any) {
        changeValue(value: -5, target: 4)

    }
    @IBAction func negOnePlayerFour(_ sender: Any) {
        changeValue(value: -1, target: 4)

    }
    @IBAction func posOnePlayerFour(_ sender: Any) {
        changeValue(value: 1, target: 4)

    }
    @IBAction func posFivePlayerFour(_ sender: Any) {
        changeValue(value: 5, target: 4)

    }
}

