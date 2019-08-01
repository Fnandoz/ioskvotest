//
//  ViewController.swift
//  KVOTest
//
//  Created by Fernando Gomes on 31/07/19.
//  Copyright © 2019 Fernando Gomes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var nameObservationToken: NSKeyValueObservation?
    var inputObservationToken: NSKeyValueObservation?
    
    @objc let user = User()
    
    @objc dynamic var inputText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nameObservationToken = observe(\.user.name, options: [.new]) { (vc, change) in
            guard let updatedName = change.newValue else { return }
            vc.nameLabel.text = updatedName
        }
        
        inputObservationToken = observe(\.inputText, options: .new) { (vc, change) in
            guard let updatedInputText = change.newValue as? String else { return }
            vc.textLabel.text = updatedInputText
        }
        
        addObserver(self, forKeyPath: #keyPath(user.age), options: .new, context: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        nameObservationToken?.invalidate()
    }

    @IBAction func updateNameAction() {
        user.name = "Test"
    }
    
    @IBAction func updateAgeAction() {
        user.setValue(25, forKey: "age")
    }
    
    @IBAction func textChangeAction() {
        inputText = textField.text
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if keyPath == #keyPath(user.age) {
            guard let updatedAge = change?[.newKey] as? Int else { return }
            ageLabel.text = String(updatedAge)
        }
    }
}

