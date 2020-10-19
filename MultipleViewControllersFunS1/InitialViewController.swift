//
//  ViewController.swift
//  MultipleViewControllersFunS1
//
//  Created by Gina Sprint on 10/15/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

// MARK: - Multiple View Controllers
// so far all of our apps have had one screen
// recall: 1 scene in IB = 1 screen = managed by 1 view controller

// MARK: - Segues
// a segue is a transition from one view controller to another
// 2 types of segues
// 1. automatic (let IB handle)
// 2. manual (we can trigger the segue in our Swift code)



class InitialViewController: UIViewController {
    @IBOutlet var usernameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToInitialVC(segue: UIStoryboardSegue) {
        print("unwinding to initial view controller")
    }

    // we want to send the username from the text field into SecondViewController
    // override the prepare(for:sender:) callback to do this
    // this is where we pass data into a second view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // executes right before a segue occurs
        // sender is the view that triggered this segue (if there is one)
        // 3 important properties of segue
        // source: this is the instigating view controller
        // destination: this is the new view controller
        // identifier: this is the string you may have setup in IB
        if let identifier = segue.identifier {
            if identifier == "automaticSegue" || identifier == "manualSegue" {
                // we want to downcast the segue.destination reference from a general UIViewController to a SecondViewController
                if let secondVC = segue.destination as? SecondViewController {
                    // task: set a property in secondVC to store the incoming username string from the username text field
                    // what should happen if the user doesn't enter in a username
                    secondVC.usernameOptional = usernameTextField.text
                }
            }
        }
    }
    
    @IBAction func manualSegueButtonPressed(_ sender: UIButton) {
        print("performing manual segue")
        
        // trigger the "manualSegue" segue
        performSegue(withIdentifier: "manualSegue", sender: self)
    }
    
    // one more segue method to show you
    // only called for automatic segues
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        // an opportunity to stop an automatic segue from happening
        // perhaps we should validate the users credentials
        // return true if they are good
        // false otherwise
        // TODO: check the user actually entered in a username
        
        return true
    }

}

