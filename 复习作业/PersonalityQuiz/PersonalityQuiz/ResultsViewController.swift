import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var resultAnswerLabel: UILabel!
    @IBOutlet weak var resultDefinitionLabel: UILabel!

    var response: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true 
        // Do any additional setup after loading the view.
    }

    func calculatePersonalityResult() {
        var frequencyOfAnswers: [AnimalType: Int] = [:] //词典类型
        let responseTypes = response.map {$0.type}//单独提出动物类型
        
        for response in responseTypes {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer)"
        resultDefinitionLabel.text = mostCommonAnswer.definination
    }

}
