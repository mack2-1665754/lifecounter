//
//  ViewController.swift
//  NibLoadingDemo
//
//  Goal: When the user pushes the "Add Person" button at the top of this
//  screen, a "name/age" (and "Happy Birthday!" button) should appear in
//  a vertically-growing list. The Person "panel" should be loaded from a
//  XIB file, and when the "Happy Birthday!" button is pressed, it should
//  increment the Person's age, and the hosting ViewController (this one)
//  should present an Alert controller that says "Happy Birthday!"
//
//  Created by Ted Neward on 4/27/21.
//

import UIKit
var hist: [String] = []

class ViewController: UIViewController {
    
    @IBOutlet weak var historyButton: UIButton!

    @IBOutlet weak var contentView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addPerson(_ sender: Any) {
        NSLog("Add Person")

        // Get a random name and age from out of nowhere
        let name = "Ted"
        let age = 50

        /* Option 1: The Hard Way
           Add a PersonPanel to the vertical center "the hard way":
            - create the raw nib file (File | New | File... | under User Interface select View), add controls into it (horizontal stack view with two children, one label and one button
            - instantiate the nib here using loadNibNamed(:owner) with an owner of nil since we want to do all the "wiring" up ourselves
            - take the resulting view from the nib (which will be the horizontal stack view) and add it into the view hierarchy under the vertical stack view (self.contentView)
            - wire up the button to print an NSLog()
         */
        /*
        nameAgeArray.append((name, age))
        NSLog("array: \(nameAgeArray)")
        
        // Instantiate a PersonPanel from the XIB
        let nib = Bundle.main.loadNibNamed("PersonPanel", owner: nil)
        let nibView = (nib?.first) as! UIView // this is the UIStackView

        NSLog("nibView has \(nibView.subviews.count) subviews") // 1 -- the UIStackView
        NSLog("nibView.subviews[0].subviews has \(nibView.subviews[0].subviews.count) subviews") // 2 -- the label and the button

        let nibLabel = nibView.subviews[0].subviews[0] as! UILabel
        nibLabel.text = "\(name) : \(age)"
        
        // Wire up the nibButton to point to a function in this ViewController
        let nibButton = nibView.subviews[0].subviews[1] as! UIButton
        nibButton.tag = nameAgeArray.count - 1 // this is our index into the nameAgeArray
        nibButton.addTarget(self, action: #selector(happyBirthdayPushed(_:)), for: .touchUpInside)
        
        // Add the subview but use the "arranged" version so that it will be arranged according to the rules of a UIStackView
        contentView.addArrangedSubview(nibView)
        // */
        
        /* Option 2: Create a custom UIView subclass to handle its own events */
        let personPanel = PersonPanelView()
        personPanel.data = (name, age)
        contentView.addArrangedSubview(personPanel)
    }
    
    // Option 1 supporting code
    /*
    var nameAgeArray : [(String, Int)] = [] // This is an array of (String, Int) tuples
    @objc func happyBirthdayPushed(_ sender: UIButton) {
        // Go get the "tag" value associated with our button
        // Remember, that's our index into the nameAgeArray
        let index = sender.tag

        // Update the array with the new age; tuples are value types, so we need to extract the pair, update the age in it locally, then store that new value back into the array
        var nameAgePair = nameAgeArray[index]
        nameAgePair.1 = nameAgePair.1 + 1
        nameAgeArray[index] = nameAgePair

        // Go find our paired label by looking at the UIStackView's children and getting the first one; update it with the new ages
        let pairedLabel = sender.superview!.subviews[0] as! UILabel
        pairedLabel.text = "\(nameAgePair.0) : \(nameAgePair.1)"

        NSLog("Happy Birthday, \(nameAgePair.0) you are now \(nameAgePair.1)")
    }
    // */

}


class PersonPanelView: UIView {

    var data : (String, Int) = ("", -1) {
        didSet {
            // Update the label with modified data
            label.text = "\(data.0) : \(data.1)"
        }
    }
    
    weak var label : UILabel!
    weak var button : UIButton!
    weak var counterLabel : UILabel!
    weak var neg5 : UIButton!
    weak var neg1 : UIButton!
    weak var pos1 : UIButton!
    weak var pos5 : UIButton!

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initSubViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.initSubViews()
    }
    
    private func initSubViews() {
        // Instantiate the nib into existence
        let nib = UINib(nibName: "PersonPanel", bundle: nil)
        let nibInstance = nib.instantiate(withOwner: self, options: nil)
        
        // Get the view from the instantiated nib and add it into our own tree
        let nibView = (nibInstance.first) as! UIView
        addSubview(nibView)
        
        // Wire up the controls to this view
        label = (nibView.subviews[0].subviews[0] as! UILabel)
        label.text = "\(data.0)"
        
        counterLabel = (nibView.subviews[0].subviews[1] as! UILabel)
        counterLabel.text = "\(data.1)"

        neg5 = (nibView.subviews[1].subviews[0] as! UIButton)
        neg5.addTarget(self, action: #selector(subtract5(_:)), for: .touchUpInside)
       
        neg1 = (nibView.subviews[1].subviews[1] as! UIButton)
        neg1.addTarget(self, action: #selector(subtract1(_:)), for: .touchUpInside)
       
        pos1 = (nibView.subviews[1].subviews[2] as! UIButton)
        pos1.addTarget(self, action: #selector(add1(_:)), for: .touchUpInside)
       
        pos5 = (nibView.subviews[1].subviews[3] as! UIButton)
        pos5.addTarget(self, action: #selector(add5(_:)), for: .touchUpInside)
       
    }
    
    @objc private func subtract5(_ sender : UIButton) {
        // Modify our internal data
        data = (data.0, data.1 - 5)
        hist.append("subtract 5 from \(data.0)")
        // Update the label with modified data
        counterLabel.text = "\(data.1)"
    }

    @objc private func subtract1(_ sender : UIButton) {
        // Modify our internal data
        data = (data.0, data.1 - 1)
        hist.append("subtract 1 from \(data.0)")

        // Update the label with modified data
        counterLabel.text = "\(data.1)"
    }
    
    @objc private func add1(_ sender : UIButton) {
        // Modify our internal data
        data = (data.0, data.1 + 1)
        hist.append("add 1 to \(data.0)")

        // Update the label with modified data
        counterLabel.text = "\(data.1)"
    }
    
    @objc private func add5(_ sender : UIButton) {
        // Modify our internal data
        data = (data.0, data.1 + 5)
        hist.append("add 5 to \(data.0)")

        // Update the label with modified data
        counterLabel.text = "\(data.1)"
    }
}

class historyView : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hist.count
    }

    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell")!
        cell.textLabel?.text = hist[indexPath.row]
        return cell
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.delegate = self

        tableView.dataSource = self
        
        addHistory()
        
        for value in hist {
            NSLog(value)
        }
        
    }
    
    private func addHistory() {
        tableView.insertRows(at: [IndexPath.init(row: hist.count-1, section: 0)], with: .automatic)
    }
}


