//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Johnny_L on 2017/9/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis: [Emoji] = [Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness"),
                           Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
                           Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
                           Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
                           Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
                           Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
                           Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
                           Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
                           Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
                           Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
                           Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"),
                           Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
                           Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black and white checkered flag.", usage: "completion")]
                    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return emojis.count
        } else {
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        1.dequeue cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell
//        2.fetch model object to display
        let emoji = emojis[indexPath.row]
//        3.configue cell
//        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)"
//        cell.detailTextLabel?.text = emoji.description
        cell.update(with: emoji)
        cell.showsReorderControl = true
//        4.return cell
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let emoji = emojis[indexPath.row]
//        print("\(emoji.symbol) \(indexPath)")
//        
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" {
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let addEditEmojiTableViewController = segue.destination as! AddEditEmojiTableViewController
            addEditEmojiTableViewController.emoji = emoji    
        }
    }
   
//    @IBAction func unwindToEmojiTableView(segue: UIStoryboard) {
//        guard segue.identifier == "saveUnwind" else { return }
//        let sourceViewController = segue.source as! AddEditEmojiTableViewController
//        
//        if let emoji = sourceViewController.emoji {
//            if let selectedIndexPath = tableView.indexPathForSelectedRow {
//                emojis[selectedIndexPath.row] = emoji
//                tableView.reloadRows(at: [selectedIndexPath], with: .none)
//            } else {
//                let newIndexPath = IndexPath(row: emojis.count, section: 0)
//                emojis.append(emoji)
//                tableView.insertRows(at: [newIndexPath], with: .automatic)
//            }
//        }
//        
//        Emoji.saveToFile(emojis: emojis)
//    }
    
}
