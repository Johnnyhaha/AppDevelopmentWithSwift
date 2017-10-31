
import UIKit

class StoreItemListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    // add item controller property
    let itemController = StoreItemController()
    
    
    var items = [StoreItem]()
    
    let queryOptions = ["movie", "music", "software", "ebook"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchTerm = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchTerm.isEmpty {
            
            // set up query dictionary
            let query: [String: String] = [
                "term": searchTerm,
                "media": mediaType,
                "lang": "en_us",
//                "limit": "2"
            ]
            
            // use the item controller to fetch items
            // if successful, use the main queue to set self.items and reload the table view
            // otherwise, print an error to the console
            itemController.fetchItems(matching: query, completion: { (items) in
                
                DispatchQueue.main.async {
                    
                    if let items = items {
                        self.items = items
                        self.tableView.reloadData()
                    } else {
                        print("Unable to load data.")
                    }
                }
            })
        }
    }
    
    func configure(cell: UITableViewCell, forItemAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = item.artist
        cell.imageView?.image = #imageLiteral(resourceName: "gray")
        // set label to the item's name
        // set detail label to the item's subtitle
        // reset the image view to the gray image
        
        let task = URLSession.shared.dataTask(with: item.artworkURL) { (data, response, error) in
            
            guard let imageData = data else {
                return
            }
            
            DispatchQueue.main.async {
                
                let image = UIImage(data: imageData)
                cell.imageView?.image = image
            }
            
            // initialize a network task to fetch the item's artwork
            // if successful, use the main queue capture the cell, to initialize a UIImage, and set the cell's image view's image to the
            // resume the task
        }
        task.resume()
    }
        
        
    
    @IBAction func filterOptionUpdated(_ sender: UISegmentedControl) {
        
        fetchMatchingItems()
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        fetchMatchingItems()
        searchBar.resignFirstResponder()
    }
}
