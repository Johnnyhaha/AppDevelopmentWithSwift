//
//  ViewController.swift
//  Apple Pie
//
//  Created by Johnny_L on 2017/9/18.
//  Copyright © 2017年 Johnny_L. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["buccaneer", "swift", "glorious",
    "incandescent", "bug", "program"]
    
    var incorrectTimesAllowed = 7
    //7.-------计算显示完游戏胜负结果，继续进行下一轮
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    
   
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newRound()

    }
    
    //3.--------通过用户点击按钮，获得选择的字母
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)
        let letter = Character((letterString?.lowercased())!)
        //4.--把选择的字母传递给游戏的状态，检查剩余的错误次数
        currentGame.playerGuessed(letter: letter)
//        updateUI()//苹果可能会掉，修改图片
        updateGameState()
    }
    
    //6.----------计算游戏胜负
    func updateGameState() {
        if currentGame.incorrectTimesRemaining == 0 {
            totalLosses += 1
        }else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }else {
            updateUI()
        }
    }
   
    var currentGame: Game!//??????Why
    
    /* 1.-----------Each round begins with the selection of a new word, 
     and resetting the number of moves the player can make to incorrectMovesAllowed */
    func newRound() {
        //8.-------
//        如果empty，则所有词都猜完了。游戏介绍，字母按钮全部失效
        if !listOfWords.isEmpty {
            var newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectTimesRemaining: incorrectTimesAllowed, guessedLetters: [])
//            激活字母按钮，为新一轮游戏准备
            enableLetterButtons(true)
            updateUI()
        }else {
            enableLetterButtons(false)
        }
    }
    
//    8.---------激活字母按钮，为新一轮游戏准备
    //enable: 妙
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    //2.----------显示label image
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord.characters {
            letters.append(String(letter))//String!
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectTimesRemaining)")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}












