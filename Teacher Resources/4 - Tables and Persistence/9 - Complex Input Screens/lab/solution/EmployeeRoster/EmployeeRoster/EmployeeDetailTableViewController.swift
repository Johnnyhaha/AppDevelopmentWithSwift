
import UIKit

class EmployeeDetailTableViewController: UITableViewController, EmployeeTypeDelegate {

    struct PropertyKeys {
        static let unwindToListIndentifier = "UnwindToListSegue"
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var dobLabel: UILabel!
    @IBOutlet weak var employeeTypeLabel: UILabel!
    @IBOutlet weak var dobDatePicker: UIDatePicker!
    
    var employee: Employee?
    var employeeType: EmployeeType?
    var isEditingDob: Bool = false {
        didSet {
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    let dobRow = 1
    let dobPickerRow = 2
    let defaultRowHeight: CGFloat = 44
    
    // MARK: - View Controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dobLabel.text = dateFormatter.string(from: employee.dateOfBirth)
            dobLabel.textColor = .black
            employeeTypeLabel.text = employee.employeeType.description()
            employeeTypeLabel.textColor = .black
        } else {
            navigationItem.title = "New Employee"
        }
    }
    
    // MARK: - IBActions
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        if let name = nameTextField.text,
            let employeeType = employeeType {
            employee = Employee(name: name, dateOfBirth: dobDatePicker.date, employeeType: employeeType)
            performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
        }
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
        performSegue(withIdentifier: PropertyKeys.unwindToListIndentifier, sender: self)
    }
    

    @IBAction func datePickerValueChanged(_ sender: Any) {
        dobLabel.text = formatDate(date: dobDatePicker.date)
    }
    
    // MARK: - Table View
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard indexPath.row == dobPickerRow else {return defaultRowHeight}
        if isEditingDob {
            return dobDatePicker.frame.height
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard indexPath.row == dobRow else {return}
        isEditingDob = !isEditingDob
        dobLabel.textColor = .black
        dobLabel.text = formatDate(date: dobDatePicker.date)
    }
    
    // MARK: - Helper methods
    
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
    
    func didSelect(employeeType: EmployeeType) {
        self.employeeType = employeeType
        employeeTypeLabel.text = employeeType.description()
        employeeTypeLabel.textColor = .black
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let employeeTypeTableViewController = segue.destination as? EmployeeTypeTableViewController else {return}
        employeeTypeTableViewController.employeeType = employee?.employeeType
        employeeTypeTableViewController.delegate = self
    }
}
