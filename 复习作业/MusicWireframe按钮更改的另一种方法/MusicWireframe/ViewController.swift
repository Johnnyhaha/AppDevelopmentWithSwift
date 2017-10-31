import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var albumImageView: UIImageView!
    
    @IBOutlet weak var reverseBackground: UIView!
    @IBOutlet weak var playPauseBackground: UIView!
    @IBOutlet weak var forwardBackground: UIView!
    
    @IBOutlet weak var reverseButton: UIButton!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var forwardButton: UIButton!
    
    var isPlaying: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reverseBackground.layer.cornerRadius = 35.0
        reverseBackground.clipsToBounds = true
        reverseBackground.alpha = 0.0
        
        playPauseBackground.layer.cornerRadius = 35.0
        playPauseBackground.clipsToBounds = true
        playPauseBackground.alpha = 0.0
        
        forwardBackground.layer.cornerRadius = 35.0
        forwardBackground.clipsToBounds = true
        forwardBackground.alpha = 0.0
    }


    @IBAction func palyPauseButtonTapped(_ sender: UIButton) {
        playPauseButton.isSelected = !playPauseButton.isSelected
        if isPlaying {
            UIView.animate(withDuration: 0.5, animations: {
                self.albumImageView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            })
        } else {
            UIView.animate(withDuration: 0.5, animations: {
                self.albumImageView.transform = CGAffineTransform.identity
            })
        }
        isPlaying = !isPlaying
    }
    

    @IBAction func touchUpInside(_ sender: UIButton) {
        var buttonBackground: UIView
        
        switch sender {
        case reverseButton:
            buttonBackground = reverseBackground
        case playPauseButton:
            buttonBackground = playPauseBackground
        case forwardButton:
            buttonBackground = forwardBackground
        default:
            return
        }
        
        UIView.animate(withDuration: 0.25, animations: {
            buttonBackground.alpha = 0.0
            sender.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            sender.transform = CGAffineTransform.identity
        }) { (_) in
            buttonBackground.transform = CGAffineTransform.identity
        }
    }
    
    @IBAction func touchDown(_ sender: UIButton) {
            let buttonBackground: UIView
            
            switch sender {
            case reverseButton:
                buttonBackground = reverseBackground
            case playPauseButton:
                buttonBackground = playPauseBackground
            case forwardButton:
                buttonBackground = forwardBackground
            default:
                return
            }
            
            UIView.animate(withDuration: 0.25) {
                buttonBackground.alpha = 0.3
                sender.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
            }
    }
    
    
}

