//
//  ViewController.swift
//  Login
//
//  Created by Johnny_L on 2017/9/20.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var forgotUsetNameButton: UIButton!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func forgetButton(_ sender: Any) {
        performSegue(withIdentifier: "second", sender: forgotUsetNameButton)
    }
    
    @IBAction func forgetPasswordButton(_ sender: Any) {
        performSegue(withIdentifier: "second", sender: forgotPasswordButton)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton  else {return}
        
        if sender == forgotPasswordButton {
            segue.destination.title = "Forget Password"
        } else if sender == forgotUsetNameButton {
            segue.destination.title = "Forget Username"
        } else {
            segue.destination.title = userNameTextField.text
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

