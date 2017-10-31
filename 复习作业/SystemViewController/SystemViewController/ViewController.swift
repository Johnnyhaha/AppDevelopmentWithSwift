import UIKit
import SafariServices
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func shareButton(_ sender: UIButton) {
        guard let image = imageView.image else {return}
        
        let acitvityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        acitvityViewController.popoverPresentationController?.sourceView = sender
        
        present(acitvityViewController, animated: true, completion: nil)
    }
    
    @IBAction func safariButton(_ sender: Any) {
        if let url = URL(string: "http://www.apple.com") {
            let safariViewController = SFSafariViewController(url: url)
            present(safariViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func cameraButton(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let alertController = UIAlertController(title: "Choose Image Source", message: nil, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
//        如果相机可以使用 sourceType
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "Camera", style: .default,handler: { action in
                //            print("User selected Camera action)"
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            })
            alertController.addAction(cameraAction)
        }
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "PhotoLibrary", style: .default) { (action) in
                //            print("User selected Photo Library action")
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(photoLibraryAction)
        }
        
        
        alertController.popoverPresentationController?.sourceView = sender
        
        present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageView.image = selectedImage
//            dismiss 清除原来的image
            dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func emailButton(_ sender: UIButton) {
        guard MFMailComposeViewController.canSendMail() else {return}
        
        let mailCompose = MFMailComposeViewController()
        mailCompose.mailComposeDelegate = self
        
        mailCompose.setToRecipients(["867814691@qq.com"])
        mailCompose.setSubject("Look at this")
        mailCompose.setMessageBody("Hello, this is an email from the app I made.", isHTML: false)
        
        present(mailCompose, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        dismiss(animated: true, completion: nil)
    }
}

