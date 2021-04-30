//
//  PersonPanelView.swift
//  NibLoadingDemo
//
//  Created by Ted Neward on 4/27/21.
//

//import UIKit

/* This is for Option 2: A custom subclass of UIView
 * It uses the same XIB as Option 1, but encapsulates everything
 * in this subclass, and makes it easier to contain the model/data
 * in one place.
 */

//var history: [String] = []
//
//class PersonPanelView: UIView {
//
//    var data : (String, Int) = ("", -1) {
//        didSet {
//            // Update the label with modified data
//            label.text = "\(data.0) : \(data.1)"
//        }
//    }
//
//    weak var label : UILabel!
//    weak var button : UIButton!
//    weak var counterLabel : UILabel!
//    weak var neg5 : UIButton!
//    weak var neg1 : UIButton!
//    weak var pos1 : UIButton!
//    weak var pos5 : UIButton!
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        self.initSubViews()
//    }
//
//    required init?(coder: NSCoder) {
//        super.init(coder: coder)
//        self.initSubViews()
//    }
//
//    private func initSubViews() {
//        // Instantiate the nib into existence
//        let nib = UINib(nibName: "PersonPanel", bundle: nil)
//        let nibInstance = nib.instantiate(withOwner: self, options: nil)
//
//        // Get the view from the instantiated nib and add it into our own tree
//        let nibView = (nibInstance.first) as! UIView
//        addSubview(nibView)
//
//        // Wire up the controls to this view
//        label = (nibView.subviews[0].subviews[0] as! UILabel)
//        label.text = "\(data.0)"
//
//        counterLabel = (nibView.subviews[0].subviews[1] as! UILabel)
//        counterLabel.text = "\(data.1)"
//
//        neg5 = (nibView.subviews[1].subviews[0] as! UIButton)
//        neg5.addTarget(self, action: #selector(subtract5(_:)), for: .touchUpInside)
//
//        neg1 = (nibView.subviews[1].subviews[1] as! UIButton)
//        neg1.addTarget(self, action: #selector(subtract1(_:)), for: .touchUpInside)
//
//        pos1 = (nibView.subviews[1].subviews[2] as! UIButton)
//        pos1.addTarget(self, action: #selector(add1(_:)), for: .touchUpInside)
//
//        pos5 = (nibView.subviews[1].subviews[3] as! UIButton)
//        pos5.addTarget(self, action: #selector(add5(_:)), for: .touchUpInside)
//
//    }
//
//    @objc private func subtract5(_ sender : UIButton) {
//        // Modify our internal data
//        data = (data.0, data.1 - 5)
//        history.append("subtract 5 from \(data.0)")
//        // Update the label with modified data
//        counterLabel.text = "\(data.1)"
//    }
//
//    @objc private func subtract1(_ sender : UIButton) {
//        // Modify our internal data
//        data = (data.0, data.1 - 1)
//        history.append("subtract 1 from \(data.0)")
//
//        // Update the label with modified data
//        counterLabel.text = "\(data.1)"
//    }
//
//    @objc private func add1(_ sender : UIButton) {
//        // Modify our internal data
//        data = (data.0, data.1 + 1)
//        history.append("add 1 to \(data.0)")
//
//        // Update the label with modified data
//        counterLabel.text = "\(data.1)"
//    }
//
//    @objc private func add5(_ sender : UIButton) {
//        // Modify our internal data
//        data = (data.0, data.1 + 5)
//        history.append("add 5 to \(data.0)")
//
//        // Update the label with modified data
//        counterLabel.text = "\(data.1)"
//    }
//}

