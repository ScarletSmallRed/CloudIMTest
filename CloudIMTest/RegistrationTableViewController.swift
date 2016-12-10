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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(RegistrationTableViewController.doneButtonTap))
        
        self.navigationController?.isNavigationBarHidden = false
        title = "Registration"
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
