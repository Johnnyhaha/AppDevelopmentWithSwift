//
//  ViewController.swift
//  AppEventCount
//
//  Created by Johnny_L on 2017/9/22.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var didFinishLunchingLabel: UILabel!
    @IBOutlet weak var didBecomeActive: UILabel!
    @IBOutlet weak var willResignActive: UILabel!
    @IBOutlet weak var didEnterBackground: UILabel!
    @IBOutlet weak var willEnterForeground: UILabel!
    @IBOutlet weak var willTerminate: UILabel!
    
    var lunchCount = 0
    var becomeActiveCount = 0
    var resignActiveCount = 0
    var enterForegroundCount = 0
    var enterBackgroundCount = 0
    var terminateCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        updateView()
    }

    func updateView() {
        didFinishLunchingLabel.text = "The app has lauched \(lunchCount) times."
        didBecomeActive.text = "applicationDidBecomeActive has been called \(becomeActiveCount) times."
        willResignActive.text = "applicationWillResignActive has been called \(resignActiveCount) times."
        didEnterBackground.text = "applicationDidEnterBackground has been called \(enterBackgroundCount) times."
        willEnterForeground.text = "applicationWillEnterForeground has been called \(enterForegroundCount) times."
        willTerminate.text = "applicationWillTerminate has been called \(terminateCount) times."
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

