import UIKit

//设置协议：用协议的方式传递修改后（didSelect）的roomtype的值
protocol SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType)
}

class SelectRoomTypeTableViewController: UITableViewController {

    var roomType: RoomType?
    var delegate: SelectRoomTypeTableViewControllerDelegate?

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return RoomType.all.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
        let roomType = RoomType.all[indexPath.row]

        cell.textLabel?.text = roomType.name
        cell.detailTextLabel?.text = "$ \(roomType.price)"
//选择的那一行打勾，其他行无 采用结构体中定义的协议==，检查ID是否相等
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        roomType = RoomType.all[indexPath.row]
//        用协议的方式传递修改后（didSelect）的roomtype的值
        delegate?.didSelect(roomType: roomType!)
        tableView.reloadData()
    }
    
}
