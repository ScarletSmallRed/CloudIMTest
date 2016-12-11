//
//  RegistrationTableViewController.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/9.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    @IBOutlet weak var textBoxName: UITextBox!
    @IBOutlet weak var textBoxPassword: UITextBox!
    @IBOutlet weak var textBoxMailbox: UITextBox!
    @IBOutlet weak var textBoxRegion: UITextBox!
    @IBOutlet weak var textBoxHintQues: UITextBox!
    @IBOutlet weak var textBoxQuesAnswer: UITextBox!
    
    @IBOutlet var textBoxRequired: [UITextBox]!
    
    var doneButton: UIBarButtonItem?
    
    var possibleInputs: Inputs = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(RegistrationTableViewController.doneButtonTap))
        doneButton = self.navigationItem.rightBarButtonItem
        doneButton?.isEnabled = false
        
        self.navigationController?.isNavigationBarHidden = false
        title = "Registration"
        
        
        
        
        
        
        
        
        
        
        
        
        let validatorUser = AJWValidator(type: .string)
        validatorUser?.addValidation(toEnsureMinimumLength: 3, invalidMessage: NSLocalizedString("at least 3 characters", comment: "UserName mini validator"))
        validatorUser?.addValidation(toEnsureMaximumLength: 15, invalidMessage: NSLocalizedString("to 15 characters", comment: "UserName max validator"))
        textBoxName.ajw_attach(validatorUser)
        
        validatorUser?.validatorStateChangedHandler = {
            (newState) in
            
            switch newState {
            case .validationStateValid:
                self.textBoxName.highlightState = .default
                self.possibleInputs.formUnion(.user)
            default:
                let errorMessage = validatorUser?.errorMessages.first as? String
                self.textBoxName.highlightState = UITextBoxHighlightState.wrong(errorMessage!)
                
                self.possibleInputs.subtract(.user)
            }
            
            self.doneButton?.isEnabled = self.possibleInputs.boolValue
            print(self.possibleInputs.rawValue)
        }
        
        
        
        
        let validatorPass = AJWValidator(type: .string)
        validatorPass?.addValidation(toEnsureMinimumLength: 3, invalidMessage: NSLocalizedString("at least 3 characters", comment: "Password mini validator"))
        validatorPass?.addValidation(toEnsureMaximumLength: 15, invalidMessage: NSLocalizedString("up to 15 characters", comment: "Password max validator"))
        textBoxPassword.ajw_attach(validatorPass)
        
        validatorPass?.validatorStateChangedHandler = {
            (newState) in
            
            switch newState {
            case .validationStateValid:
                self.textBoxPassword.highlightState = .default
                self.possibleInputs.formUnion(.pass)
            default:
                let errorMessage = validatorPass?.errorMessages.first as? String
                self.textBoxPassword.highlightState = UITextBoxHighlightState.wrong(errorMessage!)
                self.possibleInputs.subtract(.pass)
            }
            
            self.doneButton?.isEnabled = self.possibleInputs.boolValue
            print(self.possibleInputs.rawValue)
        }
        
        
        
        let validatorMail = AJWValidator(type: .string)
        validatorMail?.addValidationToEnsureValidEmail(withInvalidMessage: "Incorrect mail")
        self.textBoxMailbox.ajw_attach(validatorMail)
        
        validatorMail?.validatorStateChangedHandler = {
            (newState) in
            
            switch newState {
            case .validationStateValid:
                self.textBoxMailbox.highlightState = .default
                self.possibleInputs.formUnion(.mail)
            default:
                let errorMessage = validatorMail?.errorMessages.first as? String
                self.textBoxMailbox.highlightState = UITextBoxHighlightState.wrong(errorMessage!)
                self.possibleInputs.subtract(.mail)
            }
            
            self.doneButton?.isEnabled = self.possibleInputs.boolValue
            print(self.possibleInputs.rawValue)
        }
        
    }
    
    func doneButtonTap() {
        
        checkRequiredField()

    }
    
    func checkRequiredField() {
        
        for textField in textBoxRequired {
            if textField.text!.isEmpty {
                self.errorNotice(NSLocalizedString("Blank", comment: "Error notice for blank required fields."))
                }
            }
        
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
        guard predicate.evaluate(with: textBoxMailbox.text) else {
            self.errorNotice(NSLocalizedString("Incorrect mail", comment: "Error notice for incorrect mailbox"))
            return
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
