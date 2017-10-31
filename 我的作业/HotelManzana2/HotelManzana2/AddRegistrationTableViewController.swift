import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    func didSelect(roomType: RoomType) {
        self.roomType = roomType
        updateRoomType()
    }
    
    
        @IBOutlet weak var firstNameTextField: UITextField!
        @IBOutlet weak var lastNameTextField: UITextField!
        @IBOutlet weak var emailTextField: UITextField!
        
        @IBOutlet weak var checkInDateLabel: UILabel!
        @IBOutlet weak var checkInDatePicker: UIDatePicker!
        @IBOutlet weak var checkOutDateLabel: UILabel!
        @IBOutlet weak var checkOutDatePicker: UIDatePicker!
    
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    var ischeckInDatePickerShown: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !ischeckInDatePickerShown
        }
    }
    
    var ischeckOutDatePickerShown: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !ischeckOutDatePickerShown
        }
    }
    
    @IBOutlet weak var numberOfAdultsLabel: UILabel!
    @IBOutlet weak var numberOfAdultsStepper: UIStepper!
    @IBOutlet weak var numberOfChildrenLabel: UILabel!
    @IBOutlet weak var numberOfChildrenStepper: UIStepper!
    
    @IBOutlet weak var wifiSwitch: UISwitch!
    
    @IBOutlet weak var roomTypeLabel: UILabel!
    var roomType: RoomType?
    
    var registration: Registration? {
        guard let roomType = roomType else {return nil}
        
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        
        return Registration(firstName: firstName,
                            lastName: lastName,
                            emailAdress: email,
                            checkInDate: checkOutDate,
                            checkOutDate: checkOutDate,
                            numberOfAdults: numberOfAdults,
                            numberOfChildren: numberOfChildren,
                            roomType: roomType,
                            wifi: hasWifi)
    }
    
            override func viewDidLoad() {
                super.viewDidLoad()
        
                let date = Date()
                let midnightDoday = Calendar.current.startOfDay(for: Date())
                checkInDatePicker.minimumDate = midnightDoday
                checkInDatePicker.date = midnightDoday
                
                updateDateViews()
                updateNumberOfGuests()
                updateRoomType()
            }
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: Date input cells ---------------------------------------------------------------------
    
    
            func updateDateViews() {
                checkOutDatePicker.minimumDate = checkInDatePicker.date.addingTimeInterval(86400)
        
                let dateFormatter = DateFormatter()
                dateFormatter.dateStyle = .medium
        
                checkInDateLabel.text = dateFormatter.string(from: checkInDatePicker.date)
                checkOutDateLabel.text = dateFormatter.string(from: checkOutDatePicker.date)
            }
    
        @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
                    updateDateViews()
        }
        
    
    // MARK: Numbers Input ---------------------------------------------------------------------
    
    func updateNumberOfGuests() {
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        updateNumberOfGuests()
    }
    
    
    // MARK: Room Type ---------------------------------------------------------------------
    func updateRoomType() {
        if let roomType = roomType {
            roomTypeLabel.text = roomType.name
        } else {
            roomTypeLabel.text = "No Set"
            
        }
    }
    
    // MARK: Tabel View Delegate ---------------------------------------------------------------------
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row):
            if ischeckInDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row):
            if ischeckOutDatePickerShown {
                return 216.0
            } else {
                return 0.0
            }
        default:
            return 44.0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch (indexPath.section, indexPath.row) {
        case (checkInDatePickerCellIndexPath.section, checkInDatePickerCellIndexPath.row - 1):
            if ischeckInDatePickerShown {
                ischeckInDatePickerShown = false
            } else if ischeckOutDatePickerShown {
                ischeckOutDatePickerShown = false
                ischeckInDatePickerShown = true
            } else {
                ischeckInDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        case (checkOutDatePickerCellIndexPath.section, checkOutDatePickerCellIndexPath.row - 1):
            if ischeckOutDatePickerShown {
                ischeckOutDatePickerShown = false
            } else if ischeckInDatePickerShown {
                ischeckInDatePickerShown = false
                ischeckOutDatePickerShown = true
            } else {
                ischeckOutDatePickerShown = true
            }
            
            tableView.beginUpdates()
            tableView.endUpdates()
            
        default:
            break
        }
    }
    
    // MARK: Navigation ---------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SelectRoomType" {
            let destinationViewController = segue.destination as? SelectRoomTypeTableViewController
            destinationViewController?.delegate = self
            destinationViewController?.roomType = roomType
        }
    }
    
    
    
//        @IBAction func doneBarButtonTapped(_ sender: UIBarButtonItem) {
//                    let firstName = firstNameTextField.text ?? ""
//                    let lastName = lastNameTextField.text ?? ""
//                    let email = emailTextField.text ?? ""
//                    let checkInDate = checkInDatePicker.date
//                    let checkOutDate = checkOutDatePicker.date
//            let numberOfAdults = Int(numberOfAdultsStepper.value)
//            let numberOfChildren = Int(numberOfChildrenStepper.value)
//            let hasWifi = wifiSwitch.isOn
//            let roomChoice = roomType?.name ?? "No Set"
//
//
//                    print("DONE TAPPED")
//                    print("firstName: \(firstName)")
//                    print("lastName: \(lastName)")
//                    print("email: \(email)")
//                    print("checkIn: \(checkInDate)")
//                    print("checkOut: \(checkOutDate)")
//            print("numberOfAdults: \(numberOfAdults)")
//            print("numberOfChildren: \(numberOfChildren)")
//            print("wifi: \(hasWifi)")
//            print("roomType: \(roomChoice)")
//        }
//
        // MARK: - Table view data source
   
    }
