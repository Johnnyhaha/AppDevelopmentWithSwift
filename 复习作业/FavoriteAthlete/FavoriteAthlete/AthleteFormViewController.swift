import UIKit

class AthleteFormViewController: UIViewController {

    var athlete: Athlete?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var leageTextField: UITextField!
    @IBOutlet weak var teamTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateView()
    }

    func updateView() {
        guard let athlete = athlete else { return }
        
        nameTextField.text = athlete.name
        ageTextField.text = athlete.age
        leageTextField.text = athlete.league
        teamTextField.text = athlete.team
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text,
        let age = ageTextField.text,
        let leage = leageTextField.text,
        let team = teamTextField.text else {return}
        
        athlete = Athlete(name: name, age: age, league: leage, team: team)
        performSegue(withIdentifier: "UnwindToAthleteTable", sender: self)
    }
}
