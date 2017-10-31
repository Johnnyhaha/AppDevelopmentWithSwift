import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var spacePhotoImageView: UIImageView!
    @IBOutlet weak var descriptonLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        descriptonLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
//        photoInfoController.fetchPhotoInfo { (photoInfo) in
//            if let photoInfo = photoInfo {
//                DispatchQueue.main.async {
//                    self.title = photoInfo.title
//                    self.descriptonLabel.text = photoInfo.description
//                    if let copyright = photoInfo.copyright {
//                        self.copyrightLabel.text = "Copyright \(copyright)"
//                    } else {
//                        self.copyrightLabel.isHidden = true
//                    }
//                }
//            }
//        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in
            if let data = data,
            let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.title = photoInfo.title
                    self.spacePhotoImageView.image = image
                    self.descriptonLabel.text = photoInfo.description
                    
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        }
        task.resume()
    }
}

