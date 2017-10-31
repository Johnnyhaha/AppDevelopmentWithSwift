import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailAdressTextField: UITextField!

    @IBAction func enterButtonTapped(_ sender: UIButton) {
        if emailAdressTextField.text == "" {
            UIView.animate(withDuration: 0.2, animations: {
                let rightTransform = CGAffineTransform(translationX: 20, y: 0)
                self.emailAdressTextField.transform = rightTransform
            }) {(_) in
                
                UIView.animate(withDuration: 0.2, animations: {
                    self.emailAdressTextField.transform = CGAffineTransform.identity
                })
            }
        } else {
            performSegue(withIdentifier: "toEnterView", sender: nil)
        }
    }
}

