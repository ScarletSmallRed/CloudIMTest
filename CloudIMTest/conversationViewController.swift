//
//  conversationViewController.swift
//  CloudIMTest
//
//  Created by 沈韶泓 on 2016/12/3.
//  Copyright © 2016年 shenshaohong-institute. All rights reserved.
//

import UIKit

class conversationViewController: RCConversationViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.targetId = "tester003"
        self.title = "tester003"
//        self.userName = "ssh1374"
        self.conversationType = .ConversationType_PRIVATE
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        
        delegate?.connectServer {
            self.title = NSLocalizedString("Connected", comment: "Conversation view connected title")
        }
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
