//
//  MiddleViewController.swift
//  OrderOfEvents
//
//  Created by Johnny_L on 2017/9/20.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class MiddleViewController: UIViewController {

    @IBOutlet weak var middleLabel: UILabel!
    
    var eventNumber: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidLoad."
            eventNumber += 1
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillAppear."
            eventNumber += 1
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidAppear."
            eventNumber += 1
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewWillDisappear."
            eventNumber += 1
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if let existingText = middleLabel.text {
            middleLabel.text = "\(existingText)\nEvent number \(eventNumber) was viewDidDisappear."
            eventNumber += 1
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
