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
        
        self.targetId = "tester001"
        print(RCIMClient.shared().currentUserInfo?.userId)
        self.title = "tester001"
//        self.userName = "ssh1374"
        self.conversationType = .ConversationType_PRIVATE
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