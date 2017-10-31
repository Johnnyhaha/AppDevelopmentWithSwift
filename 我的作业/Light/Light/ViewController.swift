//
//  ViewController.swift
//  Light
//
//  Created by Johnny_L on 2017/9/14.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    @IBOutlet weak var lightButton: UIButton!
    
    @IBAction func buttonPressed(_ sender: Any)
    {
        lightOn = !lightOn
        updateUI()
    }

    func updateUI()
    {
//        if lightOn
//        {
//            view.backgroundColor = .white
////            lightButton.setTitle("OFF", for: .normal)
//        }
//        else
//        {
//            view.backgroundColor = .black
////            lightButton.setTitle("ON", for: .normal)
//        }
        view.backgroundColor = lightOn ?.white : .black
    }
    
    var lightOn = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

