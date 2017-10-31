//
//  EmojiTableViewController.swift
//  EmojiDictionary
//
//  Created by Johnny_L on 2017/9/24.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    var emojis: [Group] {
    let people1 = Emoji(symbol: "😀", name: "Grinning Face", description: "A typical smiley face.", usage: "happiness")
    let people2 = Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure")
    let people3 = Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive")
    let people4 = Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority")
    let peopleArray = Group(name: "people", emoji: [people1,people2,people3,people4])
        
    let animal1 = Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow")
    let animal2 = Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory")
    let animalArray = Group(name: "animal", emoji: [animal1,animal2])
        
    let food1 = Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti")
        let foodArray = Group(name: "food", emoji: [food1])
        
    let activity1 = Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game")
        let activityArray = Group(name: "activity", emoji: [activity1])
        
    let travel1 = Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping")
        let travelArray = Group(name: "travel", emoji: [travel1])
        
    let object1 = Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying")
        let objectArray = Group(name: "object", emoji: [object1])
        
    let symbol1 = Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness")
    let symbol2 = Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness")
        let symbolArray = Group(name: "symbol", emoji: [symbol1,symbol2])
    let flag1 = Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black and white checkered flag.", usage: "completion")
        let flagArray = Group(name: "flag", emoji: [flag1])
        
        return [peopleArray,animalArray,foodArray,activityArray,travelArray,objectArray,symbolArray,flagArray]
        
    }
                    

    
    
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
        return emojis.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis[section].emoji.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        let group = emojis[indexPath.section]
        let myEmoji = group.emoji[indexPath.row]
        
        
        cell.textLabel?.text = "\(myEmoji.symbol) - \(myEmoji.name)"
        cell.detailTextLabel?.text = myEmoji.description
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = emojis[indexPath.section]
        let myEmoji = group.emoji[indexPath.row]
        print("\(myEmoji.symbol) \(indexPath)")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return emojis[section].name
    }

}
