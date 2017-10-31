import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis: [Emoji] = []

    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return emojis.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
        let emoji = emojis[indexPath.row]
        
//        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
//        cell.detailTextLabel?.text = emoji.description
        cell.update(with: emoji)
        cell.showsReorderControl = true
        return cell
    }
    
    @IBAction func editButtonTapped(_ sender: UIBarButtonItem) {
        let tableViewEditMode = tableView.isEditing
        
        tableView.setEditing(!tableViewEditMode, animated: true)
    }
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let moveEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(moveEmoji, at: to.row)
        tableView.reloadData()
        Emoji.saveToFile(emojis: emojis)
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        Emoji.saveToFile(emojis: emojis)
    }
    
    
//    --------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let saveEmojis = Emoji.loadFromFile() {
            emojis = saveEmojis
        } else {
            emojis = Emoji.loadSampleEmojis()
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
//    -------------------------------------------------
    
    
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else {return}
//        转场 emoji数据来源
        let sourceViewController = segue.source as! AddEditTableViewController
        
//        存在数据emoji的话
        if let emoji = sourceViewController.emoji {
//            存在索引路径的话，是修改编辑了原来的数据
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                修改后的emoji插入数组原来对应的行
                emojis[selectedIndexPath.row] = emoji
//                在表视图原来对应的行重载
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
//                新添加的值，分配新的索引路径在数组最后.视图插入新的一行而不是重载
                let newIndexPath = IndexPath(row: emojis.count, section: 0)
                emojis.append(emoji)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        Emoji.saveToFile(emojis: emojis)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //只有编辑单元格转场才传递信息
        if segue.identifier == "EditEmoji" {
//            1.传递索引路径
            let indexPath = tableView.indexPathForSelectedRow!
//            2.传递对应行的数据
            let emoji = emojis[indexPath.row]
//            3.转场的目标视图控制器等
            let addEditTableViewController = segue.destination as! AddEditTableViewController
            addEditTableViewController.emoji = emoji
        }
    }
    

}
