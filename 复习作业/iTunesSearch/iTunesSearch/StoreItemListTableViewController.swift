import UIKit

class StoreItemListTableViewController: UITableViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterSegmentedControl: UISegmentedControl!
    
    let itemController = StoreItemController()
    
    var items = [StoreItem]()
    
    let queryOptions = ["movie", "music","software","ebook"]

    func fetchMatchingItems() {
        
        self.items = []
        self.tableView.reloadData()
        
        let searchItem = searchBar.text ?? ""
        let mediaType = queryOptions[filterSegmentedControl.selectedSegmentIndex]
        
        if !searchItem.isEmpty {
            
            let query = [
                "term": searchItem,
                "lang": "en_us",
                "media": mediaType
            ]
            
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
        cell.imageView?.image = #imageLiteral(resourceName: "Solid_gray")
        
        let task = URLSession.shared.dataTask(with: item.artworkURL) { (data, response, error) in
            
            guard let imageData = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data: imageData)
                cell.imageView?.image = image
            }
        }
        task.resume()
    }

    @IBAction func filterOptonUpdated(_ sender: UISegmentedControl) {
        fetchMatchingItems()
    }
    
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        configure(cell: cell, forItemAt: indexPath)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension StoreItemListTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        fetchMatchingItems()
        searchBar.resignFirstResponder()
        
    }
}

