import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myImageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        myScrollView.delegate = self
        updateZoomFor(size: view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return myImageView
    }
//缩小比例
    func updateZoomFor(size: CGSize) {
        let widthScale = size.width / myImageView.bounds.width
        let heighScale = size.height / myImageView.bounds.height
        let scale = min(widthScale, heighScale)
        myScrollView.minimumZoomScale = scale
        
    }

}

