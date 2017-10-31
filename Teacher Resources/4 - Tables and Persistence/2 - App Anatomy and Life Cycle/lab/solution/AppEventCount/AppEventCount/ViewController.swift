import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var didFinishLaunchingLabel: UILabel!
    @IBOutlet weak var willResignActiveLabel: UILabel!
    @IBOutlet weak var didEnterBackgroundLabel: UILabel!
    @IBOutlet weak var willEnterForegroundLabel: UILabel!
    @IBOutlet weak var didBecomeActiveLabel: UILabel!
    @IBOutlet weak var willTerminateLabel: UILabel!
    
    var launchCount = 0
    var resignActiveCount = 0
    var enterBackgroundCount = 0
    var enterForegroundCount = 0
    var becomeActiveCount = 0
    var willTerminateCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        didFinishLaunchingLabel.text = "The app has launched \(launchCount) times"
        willResignActiveLabel.text = "applicationWillResignActive has been called \(resignActiveCount) times"
        didEnterBackgroundLabel.text = "applicationDidEnterBackground has been called \(enterBackgroundCount) times"
        willEnterForegroundLabel.text = "applicationWillEnterForeground has been called \(enterForegroundCount) times"
        didBecomeActiveLabel.text = "applicationDidBecomeActive has been called \(becomeActiveCount) times"
        willTerminateLabel.text = "applicationWillTerminate has been called \(willTerminateCount) times"
    }
}
