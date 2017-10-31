import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailAddressTextField: UITextField!
    
    @IBAction func enterButtonTapped(_ sender: Any) {
        
        if emailAddressTextField.text == "" {
            
            UIView.animate(withDuration: 0.2, animations: {
                let rightTransform = CGAffineTransform(translationX: 20, y: 20)
                self.emailAddressTextField.transform = rightTransform
                
            }, completion: { (_) in
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.emailAddressTextField.transform = CGAffineTransform.identity
                })
            })
        } else {
            performSegue(withIdentifier: "toEnteredView", sender: nil)
        }
    }
    
}

