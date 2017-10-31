import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spacePhotoImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
//    Make the network request
    let photoInfoController = PhotoInfoController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url, completionHandler: { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                
/* The network request and its accompanying completion handler are executed on a background queue,but all user interface updates must be performed on the main queue. */
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.spacePhotoImageView.image = image
                    self.descriptionLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
            
        })
        task.resume()
    }
}

