//
//  ConversationListViewController.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/4.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class ConversationListViewController: RCConversationListViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        delegate?.connectServer {
            self.title = NSLocalizedString("Connected", comment: "Conversation lisst Connected title")
            self.reloadInputViews()
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
